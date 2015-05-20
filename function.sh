#!/bin/bash
# set -x

function cpRsaKey {
  # copy rsa key in .ssh folder in $1
  cat ~/.ssh/id_rsa.pub | ssh $1 '[ ! -d .ssh/ ] && mkdir .ssh/; cat >> .ssh/authorized_keys'
}

function installSoft {
  # update and install apps
  ssh $1 '
  sudo apt-get upgrade
  sudo apt-get update
  sudo apt-get install  netatalk screen \
                        detox bash-completion watch \
                        sane sane-utils libsane-extras xsane \
                        streamer ffmpeg gifsicle \
                        jpegoptim imagemagick gphoto2 libimage-exiftool-perl
  exit                
  '
}

function initProject {
  # init project and clone git repository

  ssh $1 '

  cli="Scripts/custom/live-cli"
  content="$cli/content/"

  [ ! -d $cli ]     && mkdir -vp $cli; git clone https://github.com/dcfvg/live-cli.git $cli
  [ ! -d $content ] && mkdir -vp $content

  exit 
  '
}

function updateProjet {
  # get code last version

  ssh $1 '
  
  cli="Scripts/custom/live-cli"
  content="$cli/content/"

  cd $cli
  git pull
  exit 
  '
}

