FROM jekyll/builder:4.0

LABEL maintainer="SoftInstigate <info@softinstigate.com>"

RUN apk upgrade --update
RUN apk add --no-cache python3-dev python3
RUN pip3 install --upgrade pip setuptools && \
    pip3 install --upgrade awscli && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    rm -r /root/.cache

RUN gem install bundler
RUN gem install jekyll-paginate
RUN gem install jekyll-minifier
RUN gem install jekyll-sitemap
    
RUN aws --version
RUN ruby --version
RUN bundler --version

ENTRYPOINT [ "jekyll" ]