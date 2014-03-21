rvm use ruby-1.9.3-p385@blog --create --rvmrc

brew install postgresql
start the db server
createuser -P -s -e pguser

bundle install
rake db:create
rake db:migrate

sudo npm install -g karma
sudo npm install -g karma-ng-scenario
karma start spec/javascripts/blog.conf.js

http://localhost:9876/



# docker

docker build -t blog .