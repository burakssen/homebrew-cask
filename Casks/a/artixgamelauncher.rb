cask "artixgamelauncher" do
    version "2.1.2"
    sha256 "bec7a75bba4e11630233a7e66ad5af6d6bf82b9efde77189363d570fe75f59d0"

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