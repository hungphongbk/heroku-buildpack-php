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
ln -s $BUILD_DIR/.heroku /app/.heroku
export PATH=/app/.heroku/php/bin:$PATH
$PHP_ROOT/bin/phpize
./configure --with-php-config=$PHP_ROOT/bin/php-config
make
make install
cd
echo "important extension memcache into php.ini"
echo "extension=memcache.so" >> /app/.heroku/php/etc/php/php.ini