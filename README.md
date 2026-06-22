# heidi

hides the names of folders and files on your macos desktop

icons and files don't move, don't get renamed in any lossy way, and still open normally.

## how?

- the visible name is replaced with an invisible unicode label (`U+2800`, plus zero-width `U+200B` to keep blank names unique).
- the original name is stored in an extended attribute (`com.heidi.original`) on the item itself, so `show` restores it exactly — cyrillic, spaces and all.
- for files, the extension is hidden via the `com.apple.FinderInfo` flag, written directly with `xattr`. no finder automation, no permission prompts. the original state is saved and restored.
- app bundles (`.app`, `.photoslibrary`, …), symlinks and dotfiles are skipped.

## requirements

macos

## install

```sh
curl -fsSL https://raw.githubusercontent.com/codepurr/heidi/main/install.sh | bash
```

## usage

```sh
heidi hide all      # hide folders and files
heidi hide img      # hide images
heidi hide folders  # hide folders
heidi hide files    # hide files
heidi show          # restore everything
heidi status        # show what is hidden
heidi reveal        # recover blank items that lost their key
heidi -h            # help
```

example: 
hide only images, then bring them back:

```sh
heidi hide img
heidi show
```

work on another folder instead of the desktop:

```sh
HEIDI_DIR=~/Documents heidi hide all
```

image extensions recognised: `jpg, jpeg, png, gif, heic, heif, webp, tiff, tif, bmp, svg`.

## recovery

if an item ever ends up with a blank name but no restore key (for example, copied to a volume without its metadata), `heidi reveal` gives it a visible `recovered-N` name.

## uninstall

```sh
heidi show          # restore any hidden names first
rm ~/.local/bin/heidi
```

## safety

- original names live on the items themselves.
- file contents, locations and types are never changed.
- no finder automation or accessibility prompts.

## license

[apache-2.0](LICENSE) © codepurr
