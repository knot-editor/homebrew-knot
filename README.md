# Homebrew tap for Knot

Nightly builds of [Knot](https://github.com/knot-editor/knot-editor) for Apple Silicon Macs.

```
brew tap knot-editor/knot
brew trust knot-editor/knot
brew install --cask knot@nightly
```

Homebrew refuses to load casks from a tap you have not trusted, so `brew trust`
is a one-time step. `brew upgrade --cask knot@nightly` follows later nightlies. The cask is
generated and pushed by the nightly workflow in the Knot repository; do not
edit `Casks/` by hand.
