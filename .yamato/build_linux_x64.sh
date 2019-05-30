sudo apt-get install -y schroot
sudo apt-get install -y binutils debootstrap
sudo apt-get install -y curl
sudo apt-get install -y m4
git submodule update --init --recursive
# try again in case previous update failed
git submodule update --init --recursive
cp .yamato/config/Stevedore.conf ~/Stevedore.conf
cd external/buildscripts
./bee
cd ../..
perl external/buildscripts/build_runtime_linux.pl -build64=1 --stevedorebuilddeps=1
echo "Making directory incomingbuilds/linux64"
mkdir -p incomingbuilds/linux64
ls -al incomingbuilds/linux64
echo "Copying builds to incomingbuilds"
cp -r builds/* incomingbuilds/linux64/
ls -al incomingbuilds/linux64