const { app } = require('.');

app.get('/random', (req, res) => {
  res.send(req.ip);
});
