#!/bin/bash
set -e

# 获取版本号
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
echo "To publish, run:"
echo "  git tag ${VERSION}"
echo "  git push origin ${VERSION}"
