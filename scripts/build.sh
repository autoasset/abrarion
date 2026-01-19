#!/bin/bash
set -e

# 帮助信息
show_help() {
    cat << EOF
用法: ./scripts/build.sh [选项]

选项:
  -v, --version VERSION    设置新版本号（格式: x.y.z）
  -i, --increment          从远程 tag 自动递增版本号（patch +1）
  -p, --publish            构建并发布到 GitHub 和 Homebrew
  -h, --help              显示此帮助信息

示例:
  ./scripts/build.sh -v 1.2.0      # 更新版本号为 1.2.0 并构建
  ./scripts/build.sh -i            # 自动递增版本号并构建
  ./scripts/build.sh -i -p         # 自动递增版本号、构建并发布
  ./scripts/build.sh               # 使用当前版本号构建
EOF
}

# 更新版本号
update_version() {
    local new_version=$1
    local appinfo_file="Sources/Features/AppInfo.swift"
    
    # 验证版本号格式
    if ! [[ $new_version =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "错误: 版本号格式无效。请使用格式: x.y.z (例如: 1.2.0)"
        exit 1
    fi
    
    # 备份原文件
    cp "$appinfo_file" "$appinfo_file.bak"
    
    # 更新版本号
    sed -i '' "s/public let version = \".*\"/public let version = \"$new_version\"/" "$appinfo_file"
    
    # 验证更新是否成功
    if grep -q "public let version = \"$new_version\"" "$appinfo_file"; then
        echo "✅ 版本号已更新为: $new_version"
        rm "$appinfo_file.bak"
    else
        echo "❌ 版本号更新失败，恢复原文件"
        mv "$appinfo_file.bak" "$appinfo_file"
        exit 1
    fi
}

# 自动递增版本号
increment_version() {
    echo "🔍 从远程获取最新 tag..."
    
    # 获取远程 tags
    git fetch --tags 2>/dev/null || true
    
    # 获取最新的语义化版本 tag (格式: x.y.z)
    latest_tag=$(git tag -l | grep -E '^[0-9]+\.[0-9]+\.[0-9]+$' | sort -V | tail -n 1)
    
    if [ -z "$latest_tag" ]; then
        echo "⚠️  未找到有效的版本 tag，使用默认版本 0.0.0"
        latest_tag="0.0.0"
    else
        echo "📌 最新远程版本: $latest_tag"
    fi
    
    # 解析版本号
    IFS='.' read -r major minor patch <<< "$latest_tag"
    
    # patch 版本 +1
    new_patch=$((patch + 1))
    new_version="${major}.${minor}.${new_patch}"
    
    echo "🚀 新版本: $new_version"
    
    # 更新版本号
    update_version "$new_version"
}

# 解析命令行参数
while [[ $# -gt 0 ]]; do
    case $1 in
        -v|--version)
            NEW_VERSION="$2"
            shift 2
            ;;
        -i|--increment)
            AUTO_INCREMENT=true
            shift
            ;;
        -p|--publish)
            DO_PUBLISH=true
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            echo "未知选项: $1"
            show_help
            exit 1
            ;;
    esac
done

# 如果设置了自动递增，则执行
if [ "$AUTO_INCREMENT" = true ]; then
    increment_version
# 否则如果提供了新版本号，则更新
elif [ -n "$NEW_VERSION" ]; then
    update_version "$NEW_VERSION"
fi

# 获取当前版本号
VERSION=$(grep -E "public let version" Sources/Features/AppInfo.swift | sed -E 's/.*"(.*)"/\1/')
echo "Building version: ${VERSION}"

# 清理并创建 release 目录
rm -rf .release
mkdir -p .release

# 构建通用二进制
echo "Building universal binary..."
swift build -c release --arch arm64 --arch x86_64

# 复制构建产物
cp .build/apple/Products/Release/abrarion .release/

# 创建 tarball
cd .release
tar -czf "abrarion-${VERSION}.tar.gz" abrarion

# 计算 SHA256
SHA256=$(shasum -a 256 "abrarion-${VERSION}.tar.gz" | cut -d ' ' -f 1)

echo ""
echo "=========================================="
echo "Build completed!"
echo "=========================================="
echo "Version:  ${VERSION}"
echo "Tarball:  .release/abrarion-${VERSION}.tar.gz"
echo "SHA256:   ${SHA256}"
echo ""

# 如果需要发布
if [ "$DO_PUBLISH" = true ]; then
    echo "=========================================="
    echo "Publishing release..."
    echo "=========================================="
    
    cd ..
    
    # 1. 推送当前代码到 GitHub
    echo "📤 Pushing code to GitHub..."
    git add .
    git commit -m "Release version ${VERSION}" || true
    git push origin main || git push origin master
    
    # 2. 创建并推送 tag
    echo "🏷️  Creating and pushing tag..."
    git tag -d "${VERSION}" 2>/dev/null || true
    git push origin ":refs/tags/${VERSION}" 2>/dev/null || true
    git tag "${VERSION}"
    git push origin "${VERSION}"
    
    # 3. 创建 GitHub Release 并上传产物
    echo "📦 Creating GitHub release..."
    if command -v gh &> /dev/null; then
        gh release delete "${VERSION}" -y 2>/dev/null || true
        gh release create "${VERSION}" \
            ".release/abrarion-${VERSION}.tar.gz" \
            --title "Release ${VERSION}" \
            --notes "Release version ${VERSION}"
    else
        echo "⚠️  警告: gh 命令未找到，跳过 GitHub Release 创建"
        echo "   请手动创建 release 或安装 GitHub CLI: brew install gh"
    fi
    
    # 4. 更新 Homebrew tap
    echo "🍺 Updating Homebrew tap..."
    HOMEBREW_DIR=".release/homebrew-abrarion"
    
    if [ -d "$HOMEBREW_DIR" ]; then
        rm -rf "$HOMEBREW_DIR"
    fi
    
    git clone --depth=1 --single-branch \
        git@github.com:autoasset/homebrew-abrarion.git \
        "$HOMEBREW_DIR"
    
    # 生成 Formula
    cat > "$HOMEBREW_DIR/Formula/abrarion.rb" << FORMULA
class Abrarion < Formula
  desc "任务编排工具"
  homepage "https://github.com/autoasset/homebrew-abrarion"
  url "https://github.com/autoasset/homebrew-abrarion/releases/download/${VERSION}/abrarion-${VERSION}.tar.gz"
  sha256 "${SHA256}"
  def install
    bin.install "abrarion"
  end
  test do
    system "false"
  end
end
FORMULA
    
    # 复制文档
    if [ -d "Documentation" ]; then
        rm -rf "$HOMEBREW_DIR/Documentation"
        cp -r Documentation "$HOMEBREW_DIR/"
    fi
    
    if [ -f "README.md" ]; then
        cp README.md "$HOMEBREW_DIR/"
    fi
    
    # 提交并推送到 Homebrew tap
    cd "$HOMEBREW_DIR"
    git add .
    git commit -m "${VERSION}"
    git push origin main || git push origin master
    
    # 删除旧 tag（如果存在）并创建新 tag
    git tag -d "${VERSION}" 2>/dev/null || true
    git push origin ":refs/tags/${VERSION}" 2>/dev/null || true
    git tag "${VERSION}"
    git push origin "${VERSION}"
    
    cd ../..
    
    echo ""
    echo "=========================================="
    echo "✅ 发布完成!"
    echo "=========================================="
    echo "GitHub Release: https://github.com/autoasset/homebrew-abrarion/releases/tag/${VERSION}"
    echo ""
    echo "用户可以通过以下方式安装:"
    echo "  brew tap autoasset/abrarion"
    echo "  brew install abrarion"
    echo ""
else
    echo "To publish, run:"
    echo "  ./scripts/build.sh -i -p"
    echo "Or manually:"
    echo "  git tag ${VERSION}"
    echo "  git push origin ${VERSION}"
fi
