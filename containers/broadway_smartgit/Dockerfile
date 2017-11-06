FROM neolao/ide:broadway
maintainer neolao <contact@neolao.com>

RUN apt-get update && apt-get install -y wget openjdk-8-jre-headless git
RUN cd /tmp && \
    wget "https://www.syntevo.com/static/smart/download/smartgit/smartgit-17_1_1.deb" && \
    dpkg -i ./smartgit-17_1_1.deb

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

ENTRYPOINT /launch.sh

