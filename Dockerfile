from ubuntu
#from keep/blog-latest

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# install dependencies
# RUN apt-get install -y build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev curl git-core openssh-server redis-server checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev logrotate libpq-dev sudo git

# install curl
RUN apt-get install curl

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

# create blog user
RUN adduser --disabled-login --gecos 'Blog' blog


# install blog
RUN cd /home/blog;\
  su git -c "git clone https://github.com/bjornno/angular-rails-blog.git";\
  #cd angular-rails-blog;\
  #su blog -c "rails s";\

# postgresql
RUN apt-get install -y postgresql postgresql-client
RUN ln -s /usr/lib/postgresql/9.1/bin/postgres /usr/local/bin/
RUN useradd pguser

# nginx
#RUN apt-get install -y nginx



# when docker is invoked with 'docker run', start this command by default
RUN cd /home/blog/angular-rails-blog;\
RUN rake db:create
RUN rake db:migrate
CMD ["rackup -p 11211"]
EXPOSE 11211