cask "quitme" do
  version :latest
  sha256 :no_check

  url "https://github.com/burakssen/QuitMe.git",
      using:  :git,
      branch: "main"

  name "QuitMe"
  desc "A brief description of QuitMe"
  homepage "https://github.com/burakssen/QuitMe"

  depends_on macos: :big_sur

  livecheck do
    skip "Tracks the main branch"
  end

  preflight_steps do
    run "/usr/bin/xcodebuild",
        args: [
          "-project", "{{staged_path}}/QuitMe.xcodeproj",
          "-scheme", "QuitMe",
          "-configuration", "Release",
          "-derivedDataPath", "{{staged_path}}/build",
          "CONFIGURATION_BUILD_DIR={{staged_path}}",
          "CODE_SIGN_IDENTITY=-",
          "CODE_SIGN_STYLE=Manual",
          "DEVELOPMENT_TEAM=",
          "-IDEPackageSupportDisableManifestSandbox=1",
          "-IDEPackageSupportDisablePackageSandbox=1",
          "OTHER_SWIFT_FLAGS=$(inherited) -disable-sandbox",
        ],
        writable_paths: [
          "{{staged_path}}",
          "~/Library/Caches/org.swift.swiftpm",
          "~/Library/org.swift.swiftpm",
          "~/Library/Caches/com.apple.dt.xcodebuild",
        ],
        env: {
          "SWIFTPM_DISABLE_SANDBOX" => "1",
        },
        network_access: true
  end

  app "QuitMe.app"

  uninstall quit: "com.burakssen.QuitMe"

  zap trash: [
    "~/Library/Application Support/QuitMe",
    "~/Library/Preferences/com.burakssen.QuitMe.plist",
  ]
end
