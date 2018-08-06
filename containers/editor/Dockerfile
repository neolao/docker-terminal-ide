FROM debian:stretch-slim
maintainer neolao <contact@neolao.com>

# General packages
run apt-get update && apt-get install -y sudo

# Packages for editorconfig
run apt-get update && apt-get install -y automake cmake libpcre3-dev git

# Packages for neovim
RUN apt-get update && apt-get install -y libtool-bin autoconf automake cmake libncurses5-dev g++ pkg-config unzip git curl python3

# Packages for tmux
RUN apt-get update && apt-get install -y libevent-dev libncurses5-dev cmake automake pkg-config git

# Packages for zsh
RUN apt-get update && apt-get install -y zsh

# Build tmux
RUN git clone https://github.com/tmux/tmux.git tmux
RUN cd tmux && ./autogen.sh
RUN cd tmux && ./configure
RUN cd tmux && make

# Build editorconfig core
RUN git clone https://github.com/editorconfig/editorconfig-core-c.git
RUN cd editorconfig-core-c && cmake . && make install && rm /usr/local/bin/editorconfig && ln -s /editorconfig-core-c/bin/editorconfig /usr/local/bin/editorconfig
RUN cd ../

# Build neovim
RUN apt-get update && apt-get install -y gettext python3-pip
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

# Packages for twin
RUN apt-get update && apt-get install -y gcc cmake libx11-dev libxpm-dev libncurses-dev zlib1g-dev libgpm-dev

# Build twin
RUN git clone https://github.com/cosmos72/twin.git
RUN cd twin && ./configure
RUN cd twin && make && make install

# Packages for libgit2
#RUN apt-get update && apt-get install -y cmake python3 gcc libssl-dev

# Build libgit2
#RUN git clone https://github.com/libgit2/libgit2.git
#RUN cd libgit2 && mkdir build && cd build && cmake .. && cmake --build .

# Packages for GRV
RUN apt-get update && apt-get install -y golang cmake libcurl3-dev libreadline-dev libncursesw5-dev wget

# Build GRV
RUN mkdir /go
ENV GOPATH /go
RUN wget -O grv https://github.com/rgburke/grv/releases/download/v0.1.3/grv_v0.1.3_linux64
RUN chmod +x /grv

# Install Fuzzy Finder
RUN git clone --depth 1 https://github.com/junegunn/fzf.git /fzf
RUN /fzf/install
RUN ln -s /fzf/bin/fzf /fzf/bin/fzy

# Install RipGrep
RUN curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
RUN dpkg -i ripgrep_0.8.1_amd64.deb

# Install HTOP
RUN apt-get update && apt-get install -y htop

# Volume
RUN mkdir /workspace
VOLUME ["/workspace"]

# Entry point
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

