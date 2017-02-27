# CrashPAD
CrashPAD is a AirBnB clone, written to demonstrate the complexities of building a full-scale web application.  It allows users to list and book "listings".

[Production](https://crash-pad.herokuapp.com/)

## Authors
* [Daniel Shin](https://github.com/dshinzie/)
* [Michael Scherer](https://github.com/mscherer11/)
* [Brad Green](https://github.com/bradgreen3)
* [Chase Dunagan](https://github.com/Cdunagan05)

## Installation
1. Clone the repository: ```git clone https://github.com/dshinzie/crash-pad.git```
2. Bundle Install: ```bundle install```
3. Install Figaro: ```figaro install```
4. Retrieve [Twilio/Authy](https://www.twilio.com/try-twilio/authy?g=%2Fconsole%2Fauthy%2Fgetting-started&t=3d00d16e4ff559b8732da59d6359b5d617e40831dbe44cc4fc3bb28880175c2f) and [Google Maps](https://developers.google.com/maps/) API keys
5. Configure the `application.yml` file with:
      * AUTHY_KEY
      * AUTHY_SID
      * TWILIO_ACCOUNT_SID
      * TWILIO_AUTH_TOKEN
      * TWILIO_NUMBER
      * GOOGLE_MAPS_API
6. Start Rails server: ```rails s```


## Testing
Testing is done via RSpec/Capybara and can be triggered in the terminal with:
```shell
rspec
```

## Reviews API
* In order to use our reviews api, you will need an api_key.
      - To get your key, create account on crash-pad.heroku.com, and go to your "Dashboard".  Your "API_Key" will be on your "Dashboard" page.

* Once you have your key, you can make requests to our reviews API. To authenticate, simply pass your key in the params.

* With our reviews API, you can READ, CREATE, UPDATE, and DELETE your own reviews.

### Read Example for all of your reviews for a listing:
* GET crash-pad.herokuapp.com/api/v1/listings/INSERT LISTING_ID_HERE/reviews.json?api_key="Your_api_key_here"
 - Required parameters: api_key

### Read Example for a single review:
* GET crash-pad.herokuapp.com/api/v1/listings/INSERT LISTING_ID HERE/INSERT REVIEW_ID HERE.json?api_key="Your_api_key_here"
      - Required parameters: api_key

### Create Example:
* POST crash-pad.herokuapp.com/api/v1/listings/INSERT LISTING_ID_HERE/reviews.json?api_key="Your_api_key_here"&body="insert body of review here"&CONTENT_TYPE='application/json'&ACCEPT='application/json'
      - Required parameters: api_key, body(body of your review as a string),
                             CONTENT_TYPE = 'application/json'
                             ACCEPT = 'application/json'

### Update Example:
* PATCH crash-pad.herokuapp.com/api/v1/listings/INSERT LISTING_ID HERE/INSERT REVIEW_ID HERE.json?api_key="Your_api_key_here"&body="insert body of review here"&CONTENT_TYPE='application/json'&ACCEPT='application/json'
      - Required parameters: api_key, body(body of your review as a string),
                             CONTENT_TYPE = 'application/json'
                             ACCEPT = 'application/json'

### Delete Example:
* DELETE crash-pad.herokuapp.com/api/v1/listings/INSERT LISTING_ID HERE/INSERT REVIEW_ID HERE.json?api_key="Your_api_key_here"
      - Required parameters: api_key
