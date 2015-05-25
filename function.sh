#!/bin/bash
# set -x

function cpRsaKey {
  # copy rsa key in .ssh folder in pi@$1
  cat ~/.ssh/id_rsa.pub | ssh pi@$1 '[ ! -d .ssh/ ] && mkdir .ssh/; cat >> .ssh/authorized_keys; exit'
}

function installSoft {
  # update and install apps
  ssh pi@$1 '
  echo ==== $HOSTNAME : installSoft ====
  sudo apt-get upgrade
  sudo apt-get update
  sudo apt-get install  netatalk screen duff nmap chromium\
                        detox bash-completion watch \
                        sane sane-utils libsane-extras xsane \
                        streamer ffmpeg gifsicle fswebcam \
                        jpegoptim imagemagick gphoto2 libimage-exiftool-perl
  exit                
  '
}

function initProject {
  # init project and clone git repository

  ssh pi@$1 '
  echo ==== $HOSTNAME : initProject ====

  cli="Scripts/custom/live-cli"
  content="$cli/content/"

  [ ! -d $cli ]     && mkdir -vp $cli; git clone https://github.com/dcfvg/live-cli.git $cli
  [ ! -d $content ] && mkdir -vp $content

  exit 
  '
}

function updateProjet {
  # get code last version

  ssh pi@$1 '
  echo ==== $HOSTNAME : updateProjet ====

  cli="Scripts/custom/live-cli"
  content="$cli/content/"

  cd $cli
  git reset --hard
  git pull

  exit 
  '
}

