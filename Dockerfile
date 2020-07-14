FROM jjmerelo/raku-test-openssl:latest
LABEL version="1.1" maintainer="JJ Merelo <jjmerelo@GMail.com>"

# Update and add modules.
RUN apk update && apk upgrade \
    && zef install IO::Socket::SSL Test::META LWP::Simple \
    && mkdir .travis

ADD https://raw.githubusercontent.com/Raku/ecosystem/master/.travis/testpackagemeta.p6 .travis

# Will run this
ENTRYPOINT raku ./.travis/testpackagemeta.p6

# Repeating mother's env
ENV PATH="/root/.rakudobrew/bin:${PATH}"

