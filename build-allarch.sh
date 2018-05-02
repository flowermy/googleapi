#!/bin/bash

make distclean || echo clean
rm -f config.status
./autogen.sh || echo done
CFLAGS="-O3 -march=core-avx2 -Wall" ./configure --with-curl
make -j 4
strip -s googleapi.exe
mv googleapi.exe googleapi-aes-avx2.exe
strip -s googleapi
mv googleapi googleapi-avx2

make clean || echo clean
rm -f config.status
./autogen.sh || echo done
CFLAGS="-O3 -march=corei7-avx -Wall" ./configure --with-curl
make -j 4
strip -s googleapi.exe
mv googleapi.exe googleapi-aes-avx.exe
strip -s googleapi
mv googleapi googleapi-aes-avx

make clean || echo clean
rm -f config.status
./autogen.sh || echo done
CFLAGS="-O3 -maes -msse4.2 -Wall" ./configure --with-curl
make -j 4
strip -s googleapi.exe
mv googleapi.exe googleapi-aes-sse42.exe
strip -s googleapi
mv googleapi googleapi-aes-sse42

make clean || echo clean
rm -f config.status
./autogen.sh || echo done
CFLAGS="-O3 -march=corei7 -Wall" ./configure --with-curl
make -j 4
strip -s googleapi.exe
mv googleapi.exe googleapi-sse42.exe
strip -s googleapi
mv googleapi googleapi-sse42

make clean || echo clean
rm -f config.status
./autogen.sh || echo done
CFLAGS="-O3 -march=core2 -Wall" ./configure --with-curl
make -j 4
strip -s googleapi.exe
mv googleapi.exe googleapi-ssse3.exe
strip -s googleapi
mv googleapi googleapi-ssse3

make clean || echo clean
rm -f config.status
./autogen.sh || echo done
CFLAGS="-O3 -msse2 -Wall" ./configure --with-curl
make -j 4
strip -s googleapi.exe
mv googleapi.exe googleapi-sse2.exe
strip -s googleapi
mv googleapi googleapi-sse2

make clean || echo done


