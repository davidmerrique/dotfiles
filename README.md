.dotfiles
-------

Running `install.sh` will recursively create symlinks and folders of everything in `./home` to `~`.

Folders will be created if they don't exist. Existing files will be overwritten.

Install on a new system
-------

```bash
git clone git://github.com/davidmerrique/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh
```
