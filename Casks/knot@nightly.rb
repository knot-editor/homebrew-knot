cask "knot@nightly" do
  version "nightly.20261113.0717"
  sha256 "e10afd7fdbf6a36fb6a9c9adc18c6d2877f2164284540a096859b02fc0a1b324"

  url "https://github.com/knot-editor/knot-editor/releases/download/nightly-20261113-0717/Knot-#{version}-macos-arm64.zip"
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
