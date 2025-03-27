cask "ani-cli" do
    version :latest
    sha256 :no_check
  
    url "https://github.com/pystardust/ani-cli/releases/latest/download/ani-cli"
    name "ani-cli"
    desc "A command-line interface for anime"
    homepage "https://github.com/pystardust/ani-cli"
  
    depends_on formula: "fzf"
    depends_on cask: "iina"
  
    binary "ani-cli", target: "#{ENV["HOME"]}/.local/bin/ani-cli"
  
    # Optional: Uninstalling
    uninstall delete: "#{ENV["HOME"]}/.local/bin/ani-cli"
end
  
# To ensure .local/bin is in PATH, add to your shell configuration file
# For bash: ~/.bashrc or ~/.bash_profile
# For zsh: ~/.zshrc
# Add this line:
# export PATH="$HOME/.local/bin:$PATH"