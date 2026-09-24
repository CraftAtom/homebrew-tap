# CraftAtom Homebrew tap

Homebrew casks for CraftAtom apps.

## Install Meridian

[Meridian](https://gitmeridian.com/) is a fast, native Git client for the Mac.

```sh
brew install craftatom/tap/meridian
```

To install the `mrd` terminal command after the app opens, choose **Settings > Command line** in
Meridian.

Meridian updates itself. Homebrew records this with `auto_updates true`, so `brew upgrade`
leaves the installed copy alone unless the cask is newer.

To remove the app and everything it stored, including the licence and trial state:

```sh
brew uninstall --zap meridian
```

## Update the cask after a release

After a Meridian release is published, run the bump script from a checkout of this repository,
review the diff, and commit:

```sh
scripts/bump.sh
```

The script reads the current version from the release manifest at
`https://api.gitmeridian.com/latest.json`, downloads that version's DMG, and rewrites the
`version` and `sha256` lines in `Casks/meridian.rb`. To check what Homebrew's livecheck sees:

```sh
brew livecheck --cask craftatom/tap/meridian
```
