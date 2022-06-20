import Features

let manager = MissionManager()
manager.register(DownloadService(), for: "download")
manager.register(XCColorMaker(), for: "xcassets-color")
