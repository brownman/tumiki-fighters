#https://www.google.co.il/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&cad=rja&uact=8&ved=0CCYQFjAB&url=https%3A%2F%2Fwiki.archlinux.org%2Findex.php%2FPacman_Rosetta&ei=9y0-VMmuAc3yaNipgPgB&usg=AFQjCNEh0yeRzkBcbT1jxdwPoBo0v_GRHA&sig2=_gRDlOnxkSBFctOfbEgSlQ&bvm=bv.77412846,d.d2s

#recent changes to code:
#http://stackoverflow.com/questions/9903541/finding-diff-between-current-and-last-versions

#debian package - recompiling
#http://www.cyberciti.biz/faq/rebuilding-ubuntu-debian-linux-binary-package/

#debian build tools
#https://www.debian.org/doc/manuals/maint-guide/build.en.html

 depend xdotool
 
update_blog(){
  #/tmp/PRODUCT
  git log > /tmp/1.diff
  #diff  HEAD~2..HEAD --color
}

easy(){
  #get the code
  cd /tmp
  apt-get source tumiki-fighters
  cd tumiki*
  
  #compile
  make
  echo res $?
  
  ###run
  cd /tmp/tum*
  ./tumiki-fighters
}

install(){
  sudo apt-get -qq update
  sudo apt-get install build-essential fakeroot dpkg-dev 
  sudo apt-get build-dep tumiki-fighters
}
compile(){
 # export pwd_tumiki=$PWD
  cd $dir_tumiki
  make
  echo res: $?
}

release(){
#sudo apt-get install tumiki-fighters
#  sudo apt-cache search tumiki-fighters
  #cd $HOME
  #./debian/rules binary
  dpkg-buildpackage -B
  sudo dpkg -i ../*.deb
}



test_game(){
commander $dir_tumiki/tumiki-fighters -fullscreen &

  sleep 1
  while :;do
  xdotool key ctrl
  sleep .01
  done
  
}
loop(){
    while :;do
    xcowsay "$( fortune -s )"
    done
}
#update_blog

install
compile
loop &
test_game &

#git_commit=$( git_previous_commit )
#git diff $commit_id HEAD >/tmp/1.diff
#  echo hello from tumiki
#  #print_g gay tumiki
#  git clone --depth=3 https://github.com/brownman/tumiki-fighters --branch=game
#  cd tumiki*
