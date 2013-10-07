# Revily::Web

## NAME

Revily - It wakes you up!

[![Build Status](https://secure.travis-ci.org/revily/revily-web.png?branch=master)](https://travis-ci.org/revily/revily-web)
[![Code Climate](https://codeclimate.com/github/revily/revily-web.png)](https://codeclimate.com/github/revily/revily-web)
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/revily/revily-web/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/df59799a89c2ecdad827f45ea3f19762 "githalytics.com")](http://githalytics.com/revily/revily-web)

## DESCRIPTION

Revily is an on-call management and incident response service. Revily::Web is the fancy frontend to the Revily server.

## DEPENDENCIES

* [Ruby >= 1.9.3](https://www.ruby-lang.org/)
* [Revily Server](https://github.com/revily/revily/)

## OPTIONS

## ENVIRONMENT

## DEPLOYMENT

Configure `config/application.yml` with your credentials:

```yaml
SECRET_TOKEN: 2fad77b0cccfbadcd4616a336f0538b9
TWILIO_ACCOUNT_SID: ACa7aae08a4e2bcdaa3ad00797e6736021
TWILIO_AUTH_TOKEN: 7a777c79a299dddda93b523dee44d9fd
MAILER_URL: appliedawesome.com
```


### Heroku quick deploy

```bash
heroku create
rake figaro:heroku
git push heroku master
heroku run rake db:schema:load
```

## HISTORY

## BUGS

## COPYRIGHT

Revily is Copyright &copy; 2013 Dan Ryan <hi@iamdanryan.com>

## SEE ALSO

[pagerduty(1)](http://pagerduty.com), [opsgenie(1)](http://opsgenie.com)
