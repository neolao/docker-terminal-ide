Terminal IDE with Docker
========================

Installation
------------
Clone the project including submodules:

```bash
git clone --recursive https://github.com/neolao/docker-terminal-ide.git
```

Build the Docker container:

```bash
cd containers/editor
./build.sh
```

Add the start script to `/usr/local/bin`:

```bash
sudo printf '%s\n%s\n' '#!/bin/bash' "$(pwd)/start.sh \$@" > /usr/local/bin/ide
chmod +x /usr/local/bin/ide
```

Start options
-------------

```
Usage: ide [OPTION]... [FOLDER]
Open the IDE on a specific FOLDER. The default value is the current directory.

Examples:
    ./start.sh
    ./start.sh /path/to/project/directory
    ./start.sh /path/to/file.txt
    ./start.sh --nodejs=8 /path/to/file.js

Options:
    --nodejs=N    Install NodeJS version N
    --tmux        Use TMUX
```

HELP
----

[See the help page](config/home/help.md)

Softwares
---------

| Name   | Version  |
| ------ | -------- |
| `nvim` | `0.5.0`  |
| `git`  | `2.23.0` |

