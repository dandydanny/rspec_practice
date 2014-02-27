#Rspec tests in the Sinatra Skeleton 

In addition to the basic sinatra setup, in order to run tests, you need to create a test database.  Therefore, run the following command: 

    RACK_ENV=test rake db:create

This creates a test database for rspec to shove dummy data into, so that your tests do not pollute the regular database. 

With love and help from https://github.com/tararoys
