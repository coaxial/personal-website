# Personal-website
[![Code Climate](https://codeclimate.com/github/Coaxial/personal-website/badges/gpa.svg)](https://codeclimate.com/github/Coaxial/personal-website)
[![Test Coverage](https://codeclimate.com/github/Coaxial/personal-website/badges/coverage.svg)](https://codeclimate.com/github/Coaxial/personal-website)

This is my personal website. It is running Rails 4.1, Ruby 2.1.3 and Postgresql.
## Deployment
If for some reason you'd like to prentend you're me and deploy my website on your server, here are the steps.

You'll need a working [Docker](https://docs.docker.com/installation/#installation) and [Fig](http://www.fig.sh/install.html), then:

1. `git clone git@github.com:Coaxial/personal-website.git`
2. `cd personal-website`
3. _(optional)_ Copy your own `nginx.conf` file to `lib/nginx/nginx.conf`
4. _(optional)_ Copy your SSL certificates/keys to `lib/nginx/ssl-certs/`
5. _(optional)_ Copy your own `database.yml` to `config/databse.yml`
6. _(optional)_ Copy your own `secrets.yml` to `config/secrets.yml`
7. `fig build`
8. `fig up`
9. _(optional)_ Open ports 80 and 443 (if needed) in your firewall

You can then access the app via `http(s)://localhost` or `http(s)://<boot2docker ip>`

## Licence
Copyright (c) 2014 Coaxial

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
