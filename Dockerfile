FROM debian:bookworm-slim
ENV DEBIAN_FRONTEND="noninteractive"

ARG CHARSET="UTF-8"
ARG LANGUAGE="en_US"
ARG MIRROR="http://deb.debian.org/debian"
RUN \
  echo "deb $MIRROR bookworm main contrib non-free" > /etc/apt/sources.list && \
  apt-get update && apt-get upgrade -y && \
  apt-get install -y \
    libasound2 \
    libfontconfig1 \
    libgbm1 \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    libgtk-3-0 \
    locales \
    wget \
    && \
  localedef -ci "$LANGUAGE" -f "$CHARSET" -A "/usr/share/locale/locale.alias" "$LANGUAGE.$CHARSET"

COPY entrypoint.sh /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["/bin/sh"]
