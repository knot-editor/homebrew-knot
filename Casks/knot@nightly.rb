cask "knot@nightly" do
  version "nightly.20261115.0049"
  sha256 "aa2fbb2fdac80152ea4721175b9baf659be981361d10bd1abad20f334c2cca8c"

  url "https://github.com/knot-editor/knot-editor/releases/download/nightly-20261115-0049/Knot-#{version}-macos-arm64.zip"
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
