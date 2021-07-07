Welcome to the Marvel Character Collection App!

The Marvel Character Collection App is a Single Page Application (SPA). The frontend was built with HTML, CSS, and JavaScript. The frontend will communicate with a backend API built with Ruby on Rails. I designed and built this application for my phase 4 portfolio project for Flatiron School's Software Engineering bootcamp program. This application allows a user to search the Marvel API for characters. The user can add any characters they choose to their character collection. Once added to the collection, the character will be added to the Ruby on Rails API backend. Then the user will have the option to comment on and like or dislike any of the characters in their collection. In order to use the app, the user will need to sign up for an account.

I hope you like the app and have fun discovering the world of Marvel!

Requirements:

This project requires Ruby (version '2.6.1') and Ruby Gems.

Setup:

These are the steps to get the application up and running:

Step 1. Installation

You will need to clone both the frontend and backend repositories. The instructions for the backend application are listed below.

frontend - https://github.com/grantba/marvel_character_collection_app.git
backend - https://github.com/grantba/marvel_character_collection_api.git

Clone the backend repository into your developer environment, then install the required Ruby Gems by running the following commands in your terminal:

git clone https://github.com/grantba/marvel_character_collection_api.git
cd marvel_character_collection_api
bundle install

You will also need to request an API Key from the Marvel Developer Portal. They are free and can be requested at https://developer.marvel.com. The API Key is what allows you to search for Marvel characters and add them to the database. This is required in order to use the app.

Create a .env file and add your API Key to the file as follows.

PUBLIC_KEY=your_public_key
PRIVATE_KEY=your_private_key

Just be sure not to use quotation marks when assigning the value for the keys!

You can read more about how to use dotenv here...https://github.com/bkeepers/dotenv.

Step 2. Create the database

In order to create the database to store your information, you will need to run the following command in your terminal:

rails db:migrate

Step 3. Usage

This application can be run locally on your computer. Run the following command in your terminal:

rails s

With the server running, open up your favorite web browser and navigate to the following URL:

http://localhost:3000

You can use the following endpoints to view the API information.

/characters
/comments
/likes

Now, you can sign up for an account in order to use the application. Once your account is created, you're all set to browse Marvel characters, add them to your character collection, comment on, and like or dislike characters in your collection.

Contributing:

Bug reports and pull requests are welcome on GitHub at https://github.com/grantba/marvel_character_collection_api.git. For major changes, please open an issue first to discuss what you would like to change.

License:

This Ruby on Rails API application is available as open source under the terms of the MIT License (see LICENSE file for more information).

Check out my blog post:

Here is the link to my blog post where I discuss object-orientation in JavaScript.

https://grant-blaire.medium.com/object-orientation-in-javascript-bb5b21eee9d6

Video Walkthrough:

Here is the link to a video walkthrough of this application.

https://youtu.be/7wUKdupK5F0

Sources I used for my project:

All Marvel character information and images obtained through the Marvel API. © 2021 MARVEL

Marvel Developer API, https://developer.marvel.com
Marvel Background Image, https://wallpapercave.com/free-marvel-wallpaper
Blank Avatar Profile Image, https://pixabay.com/vectors/blank-profile-picture-mystery-man-973460/

Author:

Blaire Grant