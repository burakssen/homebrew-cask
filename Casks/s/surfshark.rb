cask "surfshark" do
    version :latest
    sha256 :no_check

    url "https://downloads.surfshark.com/macOS/latest/Surfshark.dmg"
    name "Surfshark"
    desc "Effortless online privacy with a VPN."
    homepage "https://surfshark.com"
    app "Surfshark.app"

    uninstall quit: "com.surfshark.Surfshark"
    zap trash: [
        "~/Library/Application Support/Surfshark",
        "~/Library/Preferences/com.surfshark.Surfshark.plist",
    ]
end


