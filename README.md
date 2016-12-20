# The Chicago Park App

Completed by Luke Schleicher

[View this repo on github](https://github.com/luke-schleicher/park-app.git)

## Guided Tour

The Chicago Park App collects all the top parks and recreational activities in the city and filters them for you based on your interests.

When you first open the app, you'll be met with a login screen. Click the "sign up here" link since this is your first time to the site.

Once you've signed up, you'll have the option to choose from wide selection of recreational activities in Chicago. Check all the activities you're interested in doing, then click the update button.

You'll be redirected to a page with a full list of all the parks you may be interested in seeing based on your interests. Click on a park to find out more information about it including a full list of its activities.

Feel free to check out your full list of activities through the "Your Activities" link at the top, add and remove activities from the "Add More activities" button, or logout.

If you choose to add more activities, try also removing some activities. Parks that feature that activities should now disappear from your parks list.

## Technical Highlights

The Chicago Park App pulls its park data from [Socrata's Open Data API](https://dev.socrata.com/).

The API-facing portion of the app can be found in the model 'api.rb'. When a user is created, this API model runs the 'generate_activities' method, which populates a list of all the activities available in the city.

Rails then serves that list to the front end through a collection_check_boxes form tag, which concisely lists all the activities. Since the API formatted the park names in a clunky way (clarendon_comm_ctr), we use a display_activity method in the model to replace the underscores and lower the caps.

The rest of the app relies on several many-to-many associations between Players, Parks and Activities--each has many of the others.

When a player is updated(ie, his favorite activities list has been updated), the generate_favorite_parks method in the player model does the work of quering the API to determine which parks fit the player's activity criteria.

The log in/ log out system is set up with a simple cookie based authentication method using the gem bcrypt.

The Socrata API token is secured using Figaro

## How To Download and Run

The simple way to run the app is to [view it on heroku](https://young-ridge-69926.herokuapp.com)

Here's what to do if you'd rather run the app on your machine:

From the command line, run 'git clone https://github.com/luke-schleicher/park-app.git' into the folder you'd like to load the app into

cd into the app with 'cd "Park App"'

Run 'bundle install'

You'll need to either contact me for the Socrata App key, or sign up for your own at https://data.cityofchicago.org/profile/app_tokens. You can then run 'bundle exec figaro install', navigate to the 'application.yml' file, and set 'SOCRATA_APP_TOKEN: (your token here)'

Since this Rails app is configured to run on a Postgresql server, you'll need to make sure you have [Postgresql installed and running](https://www.postgresql.org/download/).

Once Postgresql is running, fire up a Rails server with "rails s"

Open up a web browser and navigate to 'localhost:3000'

The park app should be up and running!