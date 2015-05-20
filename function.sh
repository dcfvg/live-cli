function cpRsaKey {
  # copy rsa key in .ssh folder in $1
  cat ~/.ssh/id_rsa.pub | ssh $1 'mkdir .ssh/; cat >> .ssh/authorized_keys'
}

function installSoft {

  # update and install apps
  ssh $1 '
  sudo apt-get upgrade
  sudo apt-get update
  sudo apt-get install  netatalk screen \
                        detox bash-completion watch \
                        sane sane-utils libsane-extras xsane \
                        streamer ffmpeg \
                        jpegoptim imagemagick gphoto2 libimage-exiftool-perl
  exit                
  '
}

function initProject {


  ssh $1 '


  exit 
  '





}