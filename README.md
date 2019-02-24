# Docker container for testing META6.json in the ecosystem

Test container, based on Alpine, with [OpenSSL](https://github.com/sergot/openssl) and the rest of the modules needed for testing Perl 6 ecosystem modules, basically Test::Meta
included. 

## Use in Travis

~~~
language:
  - minimal

services:
  - docker

install:
  - docker pull jjmerelo/perl6-test-ecosystem
  - docker images

script: docker run -t -v  $TRAVIS_BUILD_DIR:/test jjmerelo/perl6-test-ecosystem
~~~

`docker images` is not needed, but it will show you the version it is
going to use for building. 

