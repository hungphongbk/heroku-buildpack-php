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

# ln -s $BUILD_DIR/.heroku /app/.heroku
# export PATH=/app/.heroku/php/bin:$PATH
{
  /app/.heroku/php/bin/phpize
  ./configure --with-php-config=/app/.heroku/php/bin/php-config
  make
  make install
} &>/dev/null
cd
echo "important extension memcache into php.ini"
echo "extension=memcache.so" >> /app/.heroku/php/etc/php/php.ini