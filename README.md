rvm use ruby-1.9.3-p385@blog --create --rvmrc
bundle

sudo npm install -g karma
sudo npm install -g karma-ng-scenario
karma start spec/javascripts/restauranteur.conf.js

http://localhost:9876/
