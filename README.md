# CraftAtom Homebrew tap

Homebrew casks for the macOS apps that [CraftAtom](https://craftatom.com) makes.

| App | Description | Install command |
| --- | --- | --- |
| [Meridian](https://gitmeridian.com/) | Native Git client that opens from the terminal, one window per worktree | `brew install --cask craftatom/tap/meridian` |
| [Copiest](https://github.com/CraftAtom/copiest) | Clipboard history for the menu bar that keeps passwords and API keys out | `brew install --cask craftatom/tap/copiest` |
| [Zombieport](https://github.com/CraftAtom/zombieport) | Menu bar app that finds and stops the local dev servers that you forgot to stop | `brew install --cask craftatom/tap/zombieport` |

If you don't have Homebrew, install it from [the Homebrew website](https://brew.sh).
Every app in this tap is signed with a Developer ID certificate and notarized by Apple.

## Install Meridian

[Meridian](https://gitmeridian.com/) is a fast, native Git client for the Mac.

```sh
brew install --cask craftatom/tap/meridian
```

To install the `mrd` terminal command after the app opens, choose **Settings > Command line** in
Meridian.

Meridian updates itself. Homebrew records this with `auto_updates true`, so `brew upgrade`
leaves the installed copy alone unless the cask is newer.

To remove the app and everything it stored, including the licence and trial state:

```sh
brew uninstall --zap meridian
```

## Install Copiest

[Copiest](https://github.com/CraftAtom/copiest) keeps a history of the text that you copy.
To open the history from any app, press Command-Shift-V. Copiest requires macOS 14 or later.

```sh
brew install --cask craftatom/tap/copiest
```

To update Copiest, run `brew upgrade --cask copiest`. To remove the app, your clipboard
history, and your settings:

```sh
brew uninstall --zap copiest
```

## Install Zombieport

[Zombieport](https://github.com/CraftAtom/zombieport) lists the development servers that
still hold a port, such as Node.js, Bun, Deno, and Python servers, and stops the ones that
you select. Zombieport requires macOS 14 or later.

```sh
brew install --cask craftatom/tap/zombieport
```

To update Zombieport, run `brew upgrade --cask zombieport`. To remove the app and its
settings:

```sh
brew uninstall --zap zombieport
```

## Update a cask after a release

### Meridian

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

### Copiest and Zombieport

Copiest and Zombieport publish a ZIP archive on each GitHub release. After a release, follow
these steps:

1. In `Casks/copiest.rb` or `Casks/zombieport.rb`, set `version` to the new version.
2. To get the new checksum, run this command, and then copy the result to the `sha256`
   line. Replace `APP` with `copiest` or `zombieport`:

   ```sh
   brew fetch --cask --force craftatom/tap/APP
   ```

   The command reports a checksum mismatch and prints the actual checksum of the new
   archive.

3. To check the cask, run these commands:

   ```sh
   brew style --cask craftatom/tap/APP
   brew audit --cask --online --strict craftatom/tap/APP
   ```

To see which version Homebrew finds on GitHub, run
`brew livecheck --cask craftatom/tap/copiest craftatom/tap/zombieport`.

## License

The casks and scripts in this repository are available under the MIT License. For details,
see [the license file](LICENSE). Each app has its own license: Copiest and Zombieport are
available under the MIT License, and Meridian is commercial software.
