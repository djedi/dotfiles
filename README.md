# Setting up a new machine

Connect to Synology Network drive and copy the secrets backup to the root directory.

```shell
cp -r /Volumes/Dustin/secrets-backup/.* ~
```

Install xcode-select

```shell
xcode-select --install
```

Clone `dotfiles` github repo.

```shell
cd ~
git init
git remote add origin git@github.com:djedi/dotfiles.git
git fetch origin
git checkout -b master --track origin/master
git reset origin/master
```

Run .macos to set default settings

```shell
./.macos
```

Install apps.
TODO: It will stop as soon as it sets zsh as the default shell and you will need to run it again. So this should probably be a different script before installing other stuff.

```shell
./.macapps
```
