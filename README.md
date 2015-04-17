# Heroku average deploy

Striving for continuous delivery, I always wanted to know how often I deploy.

This scrappy little heroku plugin will report back the time between deploys
along with an average number of deploys per day.

## Installation

    heroku plugins:install https://github.com/cbartlett/heroku-average-deploy.git

## Usage

    heroku average:deploy -a your-app-name

## License

Copyright © Colin Bartlett, Inc.

Distributed under the terms of the MIT license.
