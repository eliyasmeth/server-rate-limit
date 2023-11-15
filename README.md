# server-rate-limit

This is a small project to show how to limit the number of request in a server.

Instructions to run the project:
- Make sure to give enough permission to the .sh files to be executed, this can be done with the next commands: 
  - `chmod +x start-services.sh stop-services.sh test.sh`
- Run start-services.sh to build and run a docker container running the app
- Run test.sh to test the application
- Run stop-services.sh to remove the docker container and image from your system


After the docker container is up and running; in the `test.sh` file, there are 2 blocks of testing based on the `CONCURRENT_REQUESTS` which is the number of requests you want to send for testing.
These are the 2 scenarios tested:
  - /rate-limit API can support up to 10 requests per second per account when an auth token is used. An auth token can represent an account.
  - /rate-limit API can support up to 10 requests per second without auth token

The .env file contains the variables to configure the limits of the API requests with/without Authentication token.
- `TIME_WINDOW` and `REQUEST_LIMIT` are the variables used for the rate limit with Authentication token.
- `TIME_WINDOW_API` and `REQUEST_LIMIT_API` are the variables used for the rate limit without Authentication token.
By default the time window value is set to 1 second, and the request limit value is set to 10 requests.

This example was made using:
  - https://www.npmjs.com/package/express
    API configuration
  - https://www.npmjs.com/package/express-rate-limit
    This is a tool to configure the rate limits for the API. Consist in a rateLimit object that can be attached to a global API or an specific endpoint.
    
