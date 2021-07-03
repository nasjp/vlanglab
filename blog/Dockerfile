FROM alpine:3.12

WORKDIR /opt/vlang

ENV VVV  /opt/vlang
ENV PATH /opt/vlang:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV VFLAGS -cc gcc

RUN mkdir -p /opt/vlang && ln -s /opt/vlang/v /usr/bin/v

RUN apk --no-cache add \
  git make upx gcc bash \
  musl-dev \
  openssl-dev sqlite-dev sqlite \
  libx11-dev glfw-dev freetype-dev

RUN git clone https://github.com/vlang/v /opt/vlang && make && v -version

RUN v symlink

## vls setting
RUN git clone https://github.com/nedpals/tree-sitter-v ~/.vmodules/tree_sitter_v
RUN git clone https://github.com/vlang/vls.git --branch use-tree-sitter vls
RUN cd vls && v cmd/vls

CMD ["v"]