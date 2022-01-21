FROM debian:buster-slim
maintainer neolao <contact@neolao.com>

RUN apt-get update && \
    apt-get install -y \
    # General packages
    sudo zsh htop unzip wget curl rsync inotify-tools automake cmake autoconf pkg-config libncurses5-dev software-properties-common \
    # Packages for editorconfig
    libpcre3-dev editorconfig \
    # Packages for neovim
    libtool-bin g++ python3 python3-pip gettext \
    # Packages for tmux
    libevent-dev bison byacc \
    # Packages for twin
    gcc libx11-dev libxpm-dev libncurses-dev zlib1g-dev libgpm-dev \
    # Packages for GRV
    golang libcurl3-dev libreadline-dev libncursesw5-dev \
    # Vim plugin: YouCompleteMe
    build-essential python3-dev \
    # Packages for C++
    clang-format

# Install git
RUN apt-add-repository "deb http://deb.debian.org/debian buster-backports main"
RUN apt-get update && apt-get -t buster-backports install -y git

# Build tmux
RUN git clone https://github.com/tmux/tmux.git tmux
RUN cd tmux && ./autogen.sh
RUN cd tmux && ./configure
RUN cd tmux && make

# Build neovim
RUN git clone https://github.com/neovim/neovim.git nvim
RUN cd nvim && make CMAKE_BUILD_TYPE=RelWithDebInfo && make install
RUN cd ../ && rm -rf nvim
RUN pip3 install neovim

# Install ctags
RUN cd / && git clone https://github.com/universal-ctags/ctags.git
RUN cd /ctags && ./autogen.sh && ./configure
RUN cd /ctags && make && make install

# Set UTF-8
RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
RUN dpkg-reconfigure --frontend=noninteractive locales

# Build twin
RUN git clone https://github.com/cosmos72/twin.git
RUN cd twin && ./configure
RUN cd twin && make && make install

# Packages for libgit2
#RUN apt-get update && apt-get install -y cmake python3 gcc libssl-dev

# Build libgit2
#RUN git clone https://github.com/libgit2/libgit2.git
#RUN cd libgit2 && mkdir build && cd build && cmake .. && cmake --build .

# Build GRV
RUN mkdir /go
ENV GOPATH /go
RUN wget -O grv https://github.com/rgburke/grv/releases/download/v0.3.2/grv_v0.3.2_linux64
RUN chmod +x /grv
RUN mv /grv /usr/local/bin/grv

# Install Fuzzy Finder
RUN git clone --depth 1 https://github.com/junegunn/fzf.git /fzf
RUN /fzf/install
RUN ln -s /fzf/bin/fzf /fzf/bin/fzy

# Install RipGrep
RUN curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
RUN dpkg -i ripgrep_0.8.1_amd64.deb

# Install Git LFS
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
RUN apt-get install -y git-lfs

# Install Terminal Markdown Viewer
RUN pip3 install mdv

# Install timg
#RUN apt-get install -y libwebp-dev libgraphicsmagick++-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
#RUN git clone https://github.com/hzeller/timg.git
#RUN cd timg/src && make WITH_VIDEO_DECODING=1 && make install

# Install thefuck
RUN pip3 install thefuck

# Install phpenv common dependencies
RUN apt-get update && apt-get install -y libssl-dev libsqlite3-dev libonig-dev libtidy-dev libxslt-dev libzip-dev re2c libpng-dev libjpeg-dev


# Volume
RUN mkdir /workspace
VOLUME ["/workspace"]

# Entry point
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

