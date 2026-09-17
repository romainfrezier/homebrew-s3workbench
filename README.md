# S3Workbench Homebrew tap

Homebrew distribution for [S3Workbench](https://github.com/romainfrezier/S3Workbench),
a native browser for S3-compatible storage.

Requires Apple Silicon and macOS 15 or later.

## Install and upgrade

```sh
brew tap romainfrezier/s3workbench
brew install --cask s3-workbench
brew update
brew upgrade --cask s3-workbench
```

The cask installs the versioned [GitHub Release DMG](https://github.com/romainfrezier/S3Workbench/releases/latest)
and checks its SHA-256. Manual DMG installation remains available.

The current application is ad-hoc signed and not notarized. Homebrew does not
change Gatekeeper trust or bypass quarantine. Follow macOS's standard
Privacy & Security review if first launch is blocked. There is no in-app updater.

Upgrades and `brew uninstall --cask s3-workbench` do not remove connection
profiles, local indexes, preferences or Keychain credentials. This tap has no
`zap`, custom installer or credential handling.

## Update the cask

1. Use a published, verified release from the
   [S3Workbench packaging workflow](https://github.com/romainfrezier/S3Workbench/blob/main/docs/PACKAGING.md).
2. Download both versioned assets and verify them together:

   ```sh
   VERSION=0.7.0 # Replace with the release being packaged.
   gh release download "v$VERSION" --repo romainfrezier/S3Workbench \
     --pattern "S3Workbench-$VERSION.dmg*" --dir "release-$VERSION"
   (cd "release-$VERSION" && shasum -a 256 -c "S3Workbench-$VERSION.dmg.sha256")
   ```

3. Change only `version` and `sha256` in `Casks/s3-workbench.rb`; the versioned URL
   updates automatically. Never use `:no_check` or a moving `latest` asset URL.
4. Run `brew audit --cask --strict romainfrezier/s3workbench/s3-workbench` and
   `brew style Casks/s3-workbench.rb` against the candidate in the installed tap
   checkout, then open a pull request and check its Cask workflow.

The workflow runs on an Apple Silicon GitHub runner and checks style/audit,
fresh installation, upgrade from 0.6.0 with disposable data/Keychain sentinels,
and rejection of an incorrect checksum. It does not prove interactive first
launch, Gatekeeper approval or access to an existing user's Keychain.

Implementation contract: [S3Workbench #8](https://github.com/romainfrezier/S3Workbench/issues/8).
User documentation: [S3Workbench #9](https://github.com/romainfrezier/S3Workbench/issues/9).
