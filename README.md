This program retrieves data from the [UIUC Course Explorer API](http://courses.illinois.edu/cisdocs/explorer) and exposes a simple RESTful JSON interface through which the API can be accessed.
It caches requests to prevent overuse, with configurable cache expiry.
The database uses [acid-state](http://hackage.haskell.org/package/acid-state), and the web server uses [scotty](http://hackage.haskell.org/package/scotty).
