Read about this plugin in my [StatusGator blog post](https://blog.statusgator.io/how-often-do-you-deploy/).

# Heroku average deploy

Striving for continuous delivery, I always wanted to know how often I deploy.

This scrappy little heroku plugin will report back the time between deploys
along with an average number of deploys per day.

## Installation

    heroku plugins:install https://github.com/cbartlett/heroku-average-deploy.git

## Usage

    $ heroku average:deploy -a your-app-name

    Average time between deploys:
    57643 seconds
    aka 960 minutes
    aka 16.01 hours
    aka 0.67 days

    You deploy an average of 1.5 times per day

## License

Copyright © Colin Bartlett, Inc.

Distributed under the terms of the MIT license.
