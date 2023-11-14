# server-rate-limit

This is a small project to show how to limit the number of request in a server.

The test.sh file contains everything needed for testing.
  - Build a docker image
  - Run a docker container with port 8080 open.
  - Run testing

After the docker container is up and running, there are 2 blocks of testing based on the `CONCURRENT_REQUESTS` which is the number of requests you want to send for testing.
These are the 2 scenarios tested:
  - /rate-limit API can support up to 10 requests per second per account when an auth token is used. An auth token can represent an account.
  - /rate-limit API can support up to 10 requests per second without auth token

The .env file contains the variables to configure the limits of the API requests with/without Authentication token.
- `TIME_WINDOW` and `REQUEST_LIMIT` are the variables used for the rate limit with Authentication token.
- `TIME_WINDOW_API` and `REQUEST_LIMIT_API` are the variables used for the rate limit without Authentication token.
By default the time window value is set to 1 second, and the request limit value is set to 10 requests.

Make sure to give the enough permission to the test.sh file in order to execute. For example: `chmod +x test.sh`

This example was made using:
  - https://www.npmjs.com/package/express
    API configuration
  - https://www.npmjs.com/package/express-rate-limit
    This is a tool to configure the rate limits for the API. Consist in a rateLimit object that can be attached to a global API or an specific endpoint.
    
