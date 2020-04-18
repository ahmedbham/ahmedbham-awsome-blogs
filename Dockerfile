FROM jekyll/builder:4.0

LABEL maintainer="SoftInstigate <info@softinstigate.com>"

RUN apk upgrade --update
RUN apk add --no-cache python3-dev python3
RUN pip3 install --upgrade pip setuptools && \
    pip3 install --upgrade awscli && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    rm -r /root/.cache

RUN gem install bundler -v '2.1.4'
RUN gem install jekyll-paginate
RUN gem install jekyll-minifier

    
# ENV GEM_HOME="/usr/local/bundle" 
# ENV BUNDLE_BIN="$GEM_HOME/bin"  
# ENV PATH $BUNDLE_BIN:$PATH

# RUN mkdir -p "$GEM_HOME" "$BUNDLE_BIN" \
#     && chmod 777 "$GEM_HOME" "$BUNDLE_BIN"

# WORKDIR /usr/site

# COPY Gemfile /usr/site/
# COPY Gemfile.lock /usr/site/

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install


CMD [ "irb" ]