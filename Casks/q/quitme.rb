cask "quitme" do
  version :latest
  sha256 :no_check

  url "https://github.com/burakssen/QuitMe.git",
      using:    :git,
      branch:   "main",
      verified: "github.com/burakssen/QuitMe"

  name "QuitMe"
  desc "A brief description of QuitMe"
  homepage "https://github.com/burakssen/QuitMe"

  depends_on macos: ">= :big_sur"

  livecheck do
    skip "Tracks the main branch"
  end

  preflight do
    system_command "xcodebuild",
                   args: [
                     "-project", "#{staged_path}/QuitMe.xcodeproj",
                     "-scheme", "QuitMe",
                     "-configuration", "Release",
                     "-derivedDataPath", "#{staged_path}/build",
                     "CONFIGURATION_BUILD_DIR=#{staged_path}",
                     "CODE_SIGN_IDENTITY=-",
                     "CODE_SIGN_STYLE=Manual",
                     "DEVELOPMENT_TEAM=",
                   ]
  end

  app "QuitMe.app"

  uninstall quit: "com.burakssen.QuitMe"

  zap trash: [
    "~/Library/Application Support/QuitMe",
    "~/Library/Preferences/com.burakssen.QuitMe.plist",
  ]
end