# README

* Reviews API Instructions
  * In order to use our reviews api, you will need an api_key.
      - To get your key, create account on crash-pad.heroku.com, and go to your "Dashboard".  Your "API_Key" will be on your "Dashboard" page.

  * Once you have your key, you can make requests to our reviews API. To authenticate, simply pass your key in the params.

  * With our reviews API, you can READ, CREATE, UPDATE, and DELETE your own reviews.

  * Read Example for all of your reviews for a listing:
    - GET crash-pad.heroku.com/api/v1/listings/INSERT LISTING_ID_HERE/reviews.json?api_key="Your_api_key_here"
      * Required parameters: api_key

  * Read Example for a single review:
    - GET crash-pad.heroku.com/api/v1/listings/INSERT LISTING_ID HERE/INSERT REVIEW_ID HERE.json?api_key="Your_api_key_here"
      * Required parameters: api_key

  * Create Example:
    - POST crash-pad.heroku.com/api/v1/listings/INSERT LISTING_ID_HERE/reviews.json?api_key="Your_api_key_here"&body="insert body of review here"&CONTENT_TYPE='application/json'&ACCEPT='application/json'
      * Required parameters: api_key, body(body of your review as a string),
                             CONTENT_TYPE = 'application/json'
                             ACCEPT = 'application/json'

  * Update Example:
    - PATCH crash-pad.heroku.com/api/v1/listings/INSERT LISTING_ID HERE/INSERT REVIEW_ID HERE.json?api_key="Your_api_key_here"&body="insert body of review here"&CONTENT_TYPE='application/json'&ACCEPT='application/json'
      * Required parameters: api_key, body(body of your review as a string),
                             CONTENT_TYPE = 'application/json'
                             ACCEPT = 'application/json'

  * Delete Example:
    - DELETE crash-pad.heroku.com/api/v1/listings/INSERT LISTING_ID HERE/INSERT REVIEW_ID HERE.json?api_key="Your_api_key_here"
      * Required parameters: api_key
