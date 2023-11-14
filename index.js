require('dotenv').config();
const express = require('express');
const rateLimit = require('express-rate-limit');

const app = express()
const port = process.env.PORT || 8080
const timeWindow = process.env.TIME_WINDOW || 1
const timeWindowAPI = process.env.TIME_WINDOW_API || 1
const requestLimit = process.env.REQUEST_LIMIT || 10
const requestLimitAPI = process.env.REQUEST_LIMIT_API || 10

const applyRateLimit = (req) => {
  return req.headers.authorization !== undefined; 
};

const globalRateLimiter = rateLimit({
  windowMs: timeWindowAPI * 1000, 
  max: requestLimitAPI, 
  message: "Rate limit exceeded for this API. Please try again later."
});

const accountRateLimiter = rateLimit({
  windowMs: timeWindow * 1000, 
  max: requestLimit, 
  keyGenerator: (req) => {
    return req.headers.authorization || req.query.token || 'anonymous';
  },
  message: "Rate limit exceeded for this account. Please try again later."
});

app.use('/rate-limit', (req, res, next) => {
  if (applyRateLimit(req)) {
    accountRateLimiter(req, res, next);
  } else {
    globalRateLimiter(req, res, next);
  }
});

app.get('/rate-limit', (req, res) => {
  res.send('This route is rate-limited with an auth token.');
});

app.listen(port, () => {
  console.log(`App listening on port ${port}`)
})