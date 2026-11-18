cask "knot@nightly" do
  version "nightly.20261118.1514"
  sha256 "93f6af0a623dda51b730979e7e47e9761ab3fc90e2b429456c47d17285be2e28"

  url "https://github.com/knot-editor/knot-editor/releases/download/nightly-20261118-1514/Knot-#{version}-macos-arm64.zip"
  name "Knot"
  desc "Modern text editor inspired by Emacs"
  homepage "https://github.com/knot-editor/knot-editor"

  livecheck do
    skip "Nightly builds are published by this tap."
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Knot.app"
  binary "#{appdir}/Knot.app/Contents/MacOS/knot", target: "knot"

  # The app is ad-hoc signed, not notarized, so Gatekeeper would refuse it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Knot.app"]
  end

  zap trash: [
    "~/.config/knot",
    "~/Library/Application Support/Knot",
  ]
end
