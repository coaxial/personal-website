# Personal-website
[![Code Climate](https://codeclimate.com/github/Coaxial/personal-website/badges/gpa.svg)](https://codeclimate.com/github/Coaxial/personal-website)
[![Test Coverage](https://codeclimate.com/github/Coaxial/personal-website/badges/coverage.svg)](https://codeclimate.com/github/Coaxial/personal-website)
[![Build Status](https://travis-ci.org/Coaxial/personal-website.svg?branch=master)](https://travis-ci.org/Coaxial/personal-website)

This is my personal website. It is running Rails 4.2 and is live at [https://py.poujade.org](https://py.poujade.org)
## Deployment
If for some reason you'd like to prentend you're me and deploy my website on your server, here are the steps.

You'll need a working [Docker](https://docs.docker.com/installation/#installation) and [Fig](http://www.fig.sh/install.html), then:

* `git clone https://github.com/Coaxial/personal-website.git`
* `cd personal-website`

With SSL on the server:

* `cp lib/nginx/nginx.conf.ssl.example lib/nginx/nginx.conf`
* Copy your SSL certificates/keys to `lib/nginx/ssl-certs/`

Without SSL on the server:

* `cp lib/nginx/nginx.conf.example lib/nginx/nginx.conf`

Then:

* If you have a custom `database.yml`, place it in `config/database.yml`. Otherwise, `config/database.yml.example`
will be used at build time.

Using Docker:

* Copy the sample `.env`: `cp .env.example .env` and edit the values for the secret key base and Postmark's API key.
* `docker-compose pull` to get the latest images
* `docker-compose build`
* `docker-compose up`
* Open ports 80 and 443 (if needed) in your firewall

You can then access the app via `http(s)://localhost`, `http(s)://<boot2docker ip>` or `http(s)://<fqdn>`

Using Heroku:

* Configure the `POSTMARK_API_KEY` and `SECRET_KEY_BASE` env vars on Heroku
* Add the Heroku remote as per the instructions on Heroku's website
* Push to Heroku
* Visit the app with `heroku open`

## Licence
MIT

Copyright (c) 2015 Coaxial

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
