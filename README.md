# Docker container for testing META6.json in the ecosystem

Test container, based on Alpine,
with [OpenSSL](https://github.com/sergot/openssl) and the rest of the
modules needed for testing Perl 6 ecosystem modules, basically
Test::Meta. It probably does not make a lot of sense anywhere else,
except if you want to also test correctness of the META6.json files in
Perl 6 distributions. Check it out [here](https://github.com/perl6/ecosystem/blob/master/.travis.yml)

## Use in Travis

~~~
language:
  - minimal

services:
  - docker

install:
  - docker pull jjmerelo/perl6-test-ecosystem
  - docker images # This is just for the show

script: docker run -e TRAVIS_COMMIT_RANGE="HEAD^1...HEAD" -t -v  $TRAVIS_BUILD_DIR:/test jjmerelo/perl6-test-ecosystem
~~~

`docker images` is not needed, but it will show you the version it is
going to use for building. 

