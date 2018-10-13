# Blog

## Table of Contents
* About
* Getting started
    * Installation
    * Usage
* Contributing
    * Code Style
    * Documentation
    * Testing
* TODO

## About
This project is a simple blog platform written in Ruby. You can use this platform to publish articles, links, and projects; each of these object types are markdown enabled, providing basic text formatting capability. Static content such as the "About" page as well as the footer links can be manually customized. User signup can accomodate multiple users, allowing the blog to be used for individual or group purposes.

## Getting Started
### Installation
To install, fork the repo and execute:

```
git clone [YOUR REPO URL HERE]
cd blog
bundle
```

Then, create the `.env` file and enable user signup.

```
ALLOW_SIGNUP=true
```

Create the database and run the migrations (note: you must have `postgresql` installed on your local machine.)

```
rails db:create
rails db:migrate
```

To signup, fire up the server and navigate to `http://localhost:3000/sign_up` (the link is not displayed anywhere, so you'll need to manually enter the URL any time you need to signup a user). You can disable signup through the `.env` file in your development environment or through the `ALLOW_SIGNUP` environment variable in your production environment.


### Usage
Articles, links, and projects can be created, updated, and deleted through the web application. The article text, link text, and project descriptions are all markdown enabled.

You will need to manually update the "About" page (view located in `app/views/welcome/about.html.haml`) and the footer (view located in `app/views/layout/_footer.html.haml`).

The entire application can be manually customized per your requirements, of course.

## Contributing
### Code Style
To keep a consistent code style, it is recommended to use
[rubocop](https://github.com/bbatsov/rubocop). If you use `vim` and
[syntastic](https://github.com/vim-syntastic/syntastic), you
can use `rubocop` as a Ruby checker. To manually run `rubocop`, you
can run the following commands:

```
# Run rubocop for the entire project
bundle exec rubocop
# Run rubocop for a specific file
bundle exec rubocop foo/bar.rb
```

### Documentation
Comment any code contributions according to the existing conventions within the project.
Reference the examples listed below:

Example top-level comment:

```
##
# = ClassNameGoesHere
# Author::    Richard Davis (+/- individual contributors)
# Copyright:: Copyright 2017 Dick Davis
# License::   GNU Public License 3
#
# This is a class that is something and does something.
```

Example method comment:

```
##
# This is a method that does something
```

Documentation can be generated using custom rake task. For more information on RDoc, go
[here](https://rdoc.github.io/rdoc/index.html).

```
# Run custom rake task to regenerate RDoc documentation
rake rdoc
```

### Testing
Integration tests should be written for all classes and methods. The test suite
can be run manually `bundle exec rake test`.

## TODO
* Implement resource pagination.
* Completely document application.
* Fix tests.
* Increase test coverage.
