cask "knot@nightly" do
  version "nightly.20261119.0910"
  sha256 "ef301eb8796680bb96d25814f56a9c45e4241c36bb36108eaa3778ea3f8f7159"

  url "https://github.com/knot-editor/knot-editor/releases/download/nightly-20261119-0910/Knot-#{version}-macos-arm64.zip"
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
