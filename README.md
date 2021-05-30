myapp
=====

This application is used as an example HTTP/SQLite application for [Litestream][]
tutorials. It simply maintains a count of HTTP requests and persists it to
a SQLite database.

[Litestream]: http://litestream.io


## Usage 

To build the application, simply run:

```sh
go install .
```

Then run the application and specify the location of the SQLite database:

```sh
myapp -dsn /path/to/db
```

The application is now running on http://localhost:8080/

