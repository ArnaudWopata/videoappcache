express = require 'express'
app = express()

# Serve static files
app.use express.static(__dirname + '/public')

# Set cache manifext content-type
app.use (req, res, next)->
  if req.originalUrl == '/cache.manifest'
    res.setHeader('Content-Type', 'text/cache-manifest')
  next()

app.get '/', (req, res, next)->
  res.redirect('/online.html')

port = process.env.port || 1234

app.listen port, ()->
  console.log 'listening on port', port
