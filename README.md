## Setup
This is a project running under Ruby on Rails to demo how to shorten a url for user. It provide
API access too.

You will need to install rvm by yourself, and make sure postgres server is installed in your local machine.

``` bash
>rvm install 2.2.3
>bundle install
>rake db:create
>rake db:migrate
>rails server
```

## Clean up Old Url
we use whenever, it can help to setup a cronjob by following command, and it will print out a
cronjob setting for you to paste into target VM's crontab, see [whenever's github
page](https://github.com/javan/whenever) for more detail.

``` bash
>whenever
```

For local testing
``` bash
>rails runner Url.clean_up_old_url
```

## Github repos
The code is hosted [here](https://github.com/simoniong/url_shortener)
