## Ghost Dockerfile


This repository contains a fork of the **Dockerfile** of [Ghost](https://www.ghost.org/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/dockerfile/ghost/) published to the public [Docker Registry](https://index.docker.io/).

It differs in that it
  - Does not run ghost as root
  - Publishes config and capser theme externally to volume. This makes it easy to customize the theme.

### Dependencies

* [dockerfile/nodejs](http://dockerfile.github.io/#/nodejs)


### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/dockerfile/ghost/) from public [Docker Registry](https://index.docker.io/): `docker pull dockerfile/ghost`

   (alternatively, you can build an image from Dockerfile: `docker build -t="dockerfile/ghost" github.com/dockerfile/ghost`)


### Usage

    docker run -d -p 80:2368 dockerfile/ghost

#### Customizing Ghost

    docker run -d -p 80:2368 -v <override-dir>:/ghost-override dockerfile/ghost

where `<override-dir>` is an absolute path of a directory that could contain:

  - `config.js`: custom config file copied from [here](https://github.com/TryGhost/Ghost/blob/master/config.example.js) (you must replace `127.0.0.1` with `0.0.0.0`)
  - `content/data/`: persistent/shared data
  - `content/images/`: persistent/shared images
  - `content/themes/`: more themes

After few seconds, open `http://<host>` for blog or `http://<host>/ghost` for admin page.

#### Selecting a UID/GID

You can control the uid and gid of the ghost user:

    docker run -d -p 80:2368 -v <override-dir>:/ghost-override -e GHOST_UID=<uid> -e GHOST_GID=<gid> dockerfile/ghost

You may want to do this if you have a user in your host system that you're using to own the ghost
overrides.