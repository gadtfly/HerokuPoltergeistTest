```bash
$ heroku create --stack cedar --buildpack https://github.com/ddollar/heroku-buildpack-multi.git
$ heroku config:set PATH="/usr/local/bin:/usr/bin:/bin:/app/vendor/phantomjs/bin"
$ heroku config:set LD_LIBRARY_PATH="/usr/local/lib:/usr/lib:/lib:/app/vendor/phantomjs/lib"
```