# Create a temp file to log the installation data
touch temp.txt

echo "Installation started!" >> temp

# update tha packages
apt-get update
apt-get -y upgrade
echo "Update done!" >> temp

# Installing goAccess
# Install dependencies
# the only required dependency is the ncurses library and gcc
echo "Installing dependencies.................." >> temp
apt-get -y install libncursesw5-dev gcc make
apt-get -y install libgeoip-dev libtokyocabinet-dev
echo "Installed dependencies!"

# Download the GoAccess tarball by running
echo "Downloading and installing goaccess package............" >> temp
wget http://tar.goaccess.io/goaccess-1.2.tar.gz
# extract the package
tar -xzvf goaccess-1.2.tar.gz
echo "Download goaccess Success!" >> temp

# configure and install the package
cd goaccess-1.2
make
make install
echo "Installed and configured goaccess" >> temp


# Install nginx
echo "Installing nginx.............." >> temp
apt-get -y install nginx