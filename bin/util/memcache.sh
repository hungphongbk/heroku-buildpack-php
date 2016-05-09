#!/usr/bin/env bash
# Build Path: /app/.heroku/php/

dep_url="git://github.com/hungphongbk/memcache.git"
memcache_dir=memcache
echo "-----> Building Memcache..."

### Memcache
echo "[LOG] Downloading Memcache"
git clone $dep_url -q
if [ ! -d "$memcache_dir" ]; then
  echo "[ERROR] Failed to find Memcache directory $memcache_dir"
  exit
fi
cd $memcache_dir

BUILD_DIR=$1
# ln -s $BUILD_DIR/.heroku /app/.heroku
# export PATH=/app/.heroku/php/bin:$PATH
ls $BUILD_DIR
/app/php/bin/phpize
./configure --with-php-config=/app/php/bin/php-config
make
make install
cd
echo "important extension memcache into php.ini"
echo "extension=memcache.so" >> /app/.heroku/php/etc/php/php.ini