FROM ubuntu


RUN apt-get update; apt-get -y install lsb-release software-properties-common

# add sources
RUN add-apt-repository -y ppa:git-core/ppa;\
  echo deb http://us.archive.ubuntu.com/ubuntu/ $(lsb_release -cs) universe multiverse >> /etc/apt/sources.list;\
  echo deb http://us.archive.ubuntu.com/ubuntu/ $(lsb_release -cs)-updates main restricted universe >> /etc/apt/sources.list;\
  echo deb http://security.ubuntu.com/ubuntu $(lsb_release -cs)-security main restricted universe >> /etc/apt/sources.list


# install Ruby
RUN mkdir /tmp/ruby;\
  cd /tmp/ruby;\
  curl ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz | tar xz;\
  cd ruby-2.0.0-p247;\
  chmod +x configure;\
  ./configure;\
  make;\
  make install;\
  gem install bundler --no-ri --no-rdoc



# postgresql
RUN apt-get install -y postgresql postgresql-client
RUN ln -s /usr/lib/postgresql/9.1/bin/postgres /usr/local/bin/

# nginx
RUN apt-get install -y nginx



# when docker is invoked with 'docker run', start this command by default
CMD ["/srv/gitlab/start.sh"] # change to rails s