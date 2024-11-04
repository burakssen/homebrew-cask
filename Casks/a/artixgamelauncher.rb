cask "artixgamelauncher" do
    version :latest
    sha256 :no_check
    
    url "https://launch.artix.com/latest/Artix%20Game%20Launcher.dmg"
    name "Artix Game Launcher"
    desc "One app. All your favorite Artix games."
    homepage "https://www.artix.com"

    app "Artix Game Launcher.app"

    zap trash: [
        "~/Library/Application Support/artixgamelauncher",
        "~/Library/Preferences/com.burakssen.artixgamelauncher.plist"
    ]
end