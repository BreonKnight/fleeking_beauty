# Fleeking Beauty: An App About Aesthetics
Fleeking Beauty allows users to unleash their aesthetic judgments upon the internet presence of any place on earth.
Users vote on photos of an unnamed place, judging whether they deem them to be "hot" or "not". We store users' vote data and display it visually using graphs.

## Contents
* **[Getting Started](#getting-started):** How can you work with our code?
* **[Wireframes](#wireframes):** How did we envision the application's user interface?
* **[User Stories](#user-stories):** How did we plan our features and organize 
* **[Heroku Link](#heroku-hosted-project)**
* **[Technologies](#technologies):** What languages, gems, libraries, and frameworks are being used?
* **[Future Development](#future-development):** What are we hoping to add?
* **[Contributors](#contributors):** Who made all of this happen?

# Getting Started
* Fork this repo and clone it onto your local machine.
* Change directory into our `fleeking-beauty` directory.
* Run `bundle install` to install gems.
* ImageMagick must be installed on your machine (Mac OS X - `brew install imagemagick`, Ubuntu - `sudo apt-get install imagemagick -y`).
* Run `rake db:setup` to create and migrate the database (PostgreSQL must be installed on your machine).
* Run `rails s` to start the server locally.


# Entity Relationship Diagram

![Wireframe 01](https://github.com/BreonKnight/fleeking_beauty/blob/master/app/assets/images/entity-relationship-diagram.png?raw=true)

# Wireframes

## Place Show Page
![Wireframe 02](https://github.com/BreonKnight/fleeking_beauty/blob/master/app/assets/images/place-show.png?raw=true)

## Place Index Page
![Wireframe 03](https://github.com/BreonKnight/fleeking_beauty/blob/master/app/assets/images/places-index.png?raw=true)

## User Show Page
![Wireframe 04](https://github.com/BreonKnight/fleeking_beauty/blob/master/app/assets/images/user-show.png?raw=true)

## Vote Page
![Wireframe 05](https://github.com/BreonKnight/fleeking_beauty/blob/master/app/assets/images/vote.png?raw=true)

# User Stories

## Sprint 1

* User can see a background/jumbotron image on the splash page.
* User can see a navbar with links to "login", "sign up".
* User can click on login link and be sent to the login page.
* User can click on sign up link and be sent to the signup page.
* User can click on about and be sent to the about page with images/pics of developers.
* User can input text into "Email" and "Password" fields.
* If email and password match user info, user can be sent to their profile page.
* If email and password do not match user info, user can see an error message and be sent back to login page.
* User can see a form with fields for "Email" and "Password" and a button for "Login."
* Add bootstrap.
* The user will fill in the fields and click Submit. If all the forms are filled with the correct data types, the user will be directed to their profile page. If the user has not completed all the forms correctly, or left some blank. An error message will be displayed and the user will have to retype in all the fields and hit submit again.
* User will see a form on the page with the following fields: first name, last name, email and username.
* Set up paperclip.
* User will see their image and the information entered on the form on their page.

## Sprint 2

* User will see a navbar on all pages displaying: home, places, vote, login, signup, about.
* When user clicks on the link they will be directed to the page clicked on.
* On the profile show page a user can click the delete profile button. A message will appear asking "Are you sure you want to delete yourself?". If the user clicks yes then they will be redirected to the splash page. If the user clicks no they will be directed to their profile page.
* User will be able to click on the edit profile button and be redirected to the edit profile page.
* User will see a form pre populated with existing profile info. The user can update these fields.
* User can press the Submit key and be redirected to the profile show page.

## Sprint 3

* A user can see a page loaded with all the places that have been created.
* A user can click a place link and will be directed to the place show page.
* A user will see all the votes associated with the place represented as a graph of its "hotness" percentage.
* User can see a default photo for paper clip.
* User can see a basic layout on the about us page.

## Sprint 4

* User will see a list of places (with votes associated).
* User will see a vote page with a photo, and two buttons, "hot" and "not".
* Clicking a "hot" will add an upvote to the place associated with the photo, and the current user.
* Clicking a "not" will add an downvote to the place associated with the photo, and the current user.

## Sprint 5

* User can't add the same place twice.
* Use user-friendly URL IDs.

---

# Heroku hosted project
[Fleeking Beauty](fleetingbeauty.herokuapp.com/ "Fleeking Beauty")

# Technologies
* Languages
	* Ruby on Rails
	* HTML5
	* CSS3
	* Javascript
* Gems/External Libraries
	* D3
	* jQuery
	* Paperclip
	* bcrypt
	* RSpec
	* Bootstrap
	* Sass
	* HTTP
	* Responders
	* ByeBug
* Third Party APIs
	* Flickr
	* Google Geocoding
	* Google Map Matrix
* Database
	*  PostgreSQL

# Future Development
* User can add a place to vote on.

# Contributors
* <a href="https://github.com/isangieri" target="_blank">Is Angieri</a>
* <a href="https://github.com/breonknight" target="_blank">Breon Knight</a>
* <a href="https://github.com/bw-giraffe" target="_blank">Rich Rizzo</a>
* <a href="https://github.com/anonym0us3" target="_blank">Nathan</a>
