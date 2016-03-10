## Setup
This is a project running under Ruby on Rails to demo how to shorten a url for user. It provide
API access too.

You will need to install rvm by yourself, and make sure postgres server is install in your local machine

``` bash
>rvm install 2.2.3
>bundle install
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
rails runner Url.clean_up_old_url
```
