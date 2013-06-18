See [**Add basic Poltergeist usage**](https://github.com/gadtfly/HerokuPoltergeistTest/commit/b6cc2647863112a1cac73049ffa3bf7d5c321098) for demo setup.

Requires local PhantomJS install. (eg: `brew install phantomjs` os OS X)

----

See [**Refit for Heroku**](https://github.com/gadtfly/HerokuPoltergeistTest/commit/d1c9aec0f6b59a0447dde5f1313a1f4889ad8f52) for setting up PhantomJS on Heroku.  I'm using [*heroku-buildpack-multi*](https://github.com/ddollar/heroku-buildpack-multi) to provide *both* of the (official, default) [*heroku-buildpack-ruby*](https://github.com/heroku/heroku-buildpack-ruby) and [*heroku-buildpack-phantomjs*](https://github.com/stomita/heroku-buildpack-phantomjs) buildpacks.

This also requires some external environment setup.

Create and initially push your app to setup a normal Rails app.  Then specify that (in subsequent builds) your app should be built with *heroku-buildpack-multi*:

```bash
$ heroku config:add BUILDPACK_URL=https://github.com/ddollar/heroku-buildpack-multi.git
```

And push again.

*heroku-buildpack-multi* looks for a [`.buildpacks` file](https://github.com/gadtfly/HerokuPoltergeistTest/commit/d1c9aec0f6b59a0447dde5f1313a1f4889ad8f52#L0L-1), which specifies the further buildpacks to load.

It also seems ("seems"; I'm not 100% sure what's going on) to throw away some environment setup from those individual buildpacks, so you need to recreate the Heroku [`Procfile`](https://github.com/gadtfly/HerokuPoltergeistTest/commit/d1c9aec0f6b59a0447dde5f1313a1f4889ad8f52#L3R0) (apparently an extremely case-sensitive filename) for running Rails web dynos, and also manually set up some paths for PhantomJS:

```bash
$ heroku config:set PATH="/usr/local/bin:/usr/bin:/bin:/app/vendor/phantomjs/bin"
$ heroku config:set LD_LIBRARY_PATH="/usr/local/lib:/usr/lib:/lib:/app/vendor/phantomjs/lib"
```