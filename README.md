Terminal IDE with Docker
========================

Clone the project including submodules:

```bash
git clone --recursive https://github.com/neolao/docker-terminal-ide.git
```

Load submodules if the project is already cloned:

```bash
git submodule update --init --recursive
```


Add the start script to `/usr/local/bin`:

```bash
sudo ln -s $(pwd)/start.sh /usr/local/bin/ide
```

Start IDE on the current directory:

```bash
ide
```

Start IDE on a specific directory:
```bash
ide ~/workspace
```
