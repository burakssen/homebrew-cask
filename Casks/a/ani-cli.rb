cask "ani-cli" do
    version :latest
    sha256 :no_check
  
    url "https://github.com/pystardust/ani-cli/releases/latest/download/ani-cli"
    name "ani-cli"
    desc "A command-line interface for anime"
    homepage "https://github.com/pystardust/ani-cli"
  
    binary "ani-cli", target: "#{ENV["HOME"]}/.local/bin/ani-cli"
  
    # Optional: Uninstalling
    uninstall delete: "#{ENV["HOME"]}/.local/bin/ani-cli"
end
  