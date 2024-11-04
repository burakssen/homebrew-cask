cask "ani-cli" do
    version :latest
    sha256 :no_check
  
    url "https://github.com/pystardust/ani-cli/releases/latest/download/ani-cli.zip"
    name "ani-cli"
    desc "A command-line interface for anime"
    homepage "https://github.com/pystardust/ani-cli"
  
    app "ani-cli.app"
  
    # Optional: Uninstalling
    uninstall quit: "com.pystardust.ani-cli"
  
    # Optional: You can add additional instructions here
end