# Use latest OpenSSL stable release
# https://www.openssl.org/source/
# 1.1.0h (2018-03-27)
cd ~/Downloads
curl -O https://www.openssl.org/source/openssl-1.1.0h.tar.gz
tar -xvzf openssl-*
cd openssl-*
./Configure darwin64-x86_64-cc
make
make test
sudo make install
cd ..
rm -rf openssl-*
# Reload terminal and check version
exit 1
which openssl
openssl version
