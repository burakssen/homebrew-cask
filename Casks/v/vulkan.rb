cask "vulkan" do
    version :latest
    sha256 :no_check
    
    url "https://sdk.lunarg.com/sdk/download/1.3.296.0/mac/vulkansdk-macos-1.3.296.0.zip"
    name "vulkan"
    desc "Vulkan SDK"
    homepage "https://vulkan.lunarg.com/sdk/home"
  
    app "vulkansdk-macos-1.3.296.0.app"
  
    uninstall quit: "com.lunarg.vulkan"
    zap trash: [
        "~/Library/Application Support/vulkan",
        "~/Library/Preferences/com.lunarg.vulkan.plist",
    ]
end