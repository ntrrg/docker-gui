---
metadata:
  website: https://hub.docker.com/r/ntrrg/gui
title: docker-gui
description: Aplicaciones gráficas de Linux en Docker.
tags:
  - contenedor
  - gui
  - docker
---

[![Docker Build Status](https://img.shields.io/docker/build/ntrrg/gui.svg)](https://hub.docker.com/r/ntrrg/gui)

**docker-gui** permite ejecutar aplicaciones gráficas de Linux en Docker.

| Etiqueta | Dockerfile |
| --: | :-- |
| `latest` | [Dockerfile](https://github.com/ntrrg/docker-gui/blob/main/Dockerfile) |

# Uso

```shell-session
$ xhost + local:docker
```

```shell-session
$ export DBUS_SOCKET="$(echo $DBUS_SESSION_BUS_ADDRESS | cut -d ',' -f 1 | cut -d '=' -f 2)"
```

```shell-session
$ docker run --rm -i -t \
    --network host \
    --device /dev/dri \
    --device /dev/snd \
    -v /dev/shm:/dev/shm \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "$HOME:/home/$USER" \
    -v "$XDG_RUNTIME_DIR:$XDG_RUNTIME_DIR" \
    -v "$DBUS_SOCKET:$DBUS_SOCKET" \
    -v "$DBUS_SOCKET:/run/dbus/system_bus_socket" \
    -e "DISPLAY=$DISPLAY" \
    -e "XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR" \
    -e "DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS" \
    -e "UID=$UID" \
    -e "USER=$USER" \
    -e "GROUPS=$(getent group audio | cut -d ':' -f 3) $(getent group video | cut -d ':' -f 3)" \
      ntrrg/gui
```

```shell-session
$ docker run --rm -i -t \
    --network host \
    --device /dev/dri \
    --device /dev/snd \
    -v /dev/shm:/dev/shm \
    -v "$HOME:/home/$USER" \
    -v "$XDG_RUNTIME_DIR:$XDG_RUNTIME_DIR" \
    -v "$DBUS_SOCKET:$DBUS_SOCKET" \
    -v "$DBUS_SOCKET:/run/dbus/system_bus_socket" \
    -e "DISPLAY=$DISPLAY" \
    -e "WAYLAND_DISPLAY=$WAYLAND_DISPLAY" \
    -e "XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR" \
    -e "DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS" \
    -e "XDG_SESSION_TYPE=wayland" \
    -e "GDK_BACKEND=wayland" \
    -e "QT_QPA_PLATFORM=wayland" \
    -e "CLUTTER_BACKEND=wayland" \
    -e "SDL_VIDEODRIVER=wayland" \
    -e "ELM_DISPLAY=wl" \
    -e "ELM_ACCEL=opengl" \
    -e "ECORE_EVAS_ENGINE=wayland_egl" \
    -e "UID=$UID" \
    -e "USER=$USER" \
    -e "GROUPS=$(getent group audio | cut -d ':' -f 3) $(getent group video | cut -d ':' -f 3)" \
      ntrrg/gui
```

# Atribuciones

Trabajando en este proyecto uso/usé:

* [Alpine](https://alpinelinux.org/)

* [River](https://github.com/riverwm/river)

* [foot](https://codeberg.org/dnkl/foot)

* [Zsh](http://www.zsh.org/)

* [GNU Screen](https://www.gnu.org/software/screen)

* [EditorConfig](http://editorconfig.org/)

* [Vim](https://www.vim.org/)

* [Git](https://git-scm.com/)

* [Docker](https://docker.com)

* [Firefox](https://www.mozilla.org/en-US/firefox/)

