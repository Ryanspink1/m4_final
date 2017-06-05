# URLockBox
URL Lockbox is a program that allows a logged in user to create a list of links, edit those links, mark them read or unread, sort by url or title, and sort by read status.

This program coordinates with the program Hot Reads to determine which links have been read the most over the past 24 hours, regardless of user (links among the top read will either be labelled "Top Link" or "Hot" depending on read count)

## Build

This application was built with rails 5.0.1

## Initial Setup

Clone the repository.
Run command `bundle install`
To serve program, run command `rails s` and navigate to url: `http://localhost:3000`

# Test Suite

Testing is run by RSpec, Capybara, and Selenium
To run test suite, run command  `rspec`

# API Documentation

API endpoints:

- `GET /api/v1/linksreadstatus` returns a list of links that have a read status of true or false based content of params[:read] (either true or false)

- `GET /api/v1/links` allows a logged in user to return a list of their associated links

- `POST /api/v1/links` allows a logged in user to create a new link

- `PUT/PATCH api/v1/links/:id` allows a logged in user to update an existing link

# Production links

- URL Lockbox: `https://urllockboxfinal.herokuapp.com/`

- Hot Reads: `https://finalhotreads.herokuapp.com`

# Known Bugs

- The only known bug is that selenium was not working properly locally and gave a CORS error in firefox.

- There are no other CORS errors in this program.

- Instructor has given this a pass as long as test coverage is normal.
