videoappcache
=============

Appcache stored videos prototype. Running on [heroku](http://videoappcache.herokuapp.com)

# Local deployment

Require `node`, `npm`, `grunt` and `coffee` to run.

```` shell
git clone git@github.com:ArnaudWopata/videoappcache.git
cd ./videoappcache
npm install
grunt build
coffee app.coffee
open http://0.0.0.0:1234
````

# Heroku deployment

You need to set custom `BUILDPACK`, `NODE_ENV` and enable env in precompile flag.

```` shell
heroku config:add BUILDPACK_URL=https://github.com/mbuchetics/heroku-buildpack-nodejs-grunt.git
heroku config:set NODE_ENV=production
heroku labs:enable user-env-compile
````

The custom build pack enable running grunt on heroku to build the app.
