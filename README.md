# capistrano2-zabbix

Tired of manually creating maintenance objects in your Zabbix monitoring
system for every new release of your application ? This gem is for you! It
automates creation and removal of necessary objects so that your code can be
released without unnecessary false alerts.


## Compatibility
capistrano2-zabbix works only with Capistrano v2. The gem for version 3 has
not been released yet.

## Installation
To install `capistrano2-zabbix` you need to add following to your `Gemfile`

`gem 'capistrano2-zabbix', '~> 0.1'`

Then in your `config/deploy.rb` you need to require the gem:

`require 'capistrano2-zabbix'`


## Configuration

* `:zabbix_url` - address of the Zabbix API endpoint.
* `:zabbix_user` - user name that has permissions to edit maintenances
* `:zabbix_password` - self explanatory
* `:zabbix_period` - number of seconds that maintance is created for
* `:zabbix_groupid` - ID of server group included in the maintenace
* `:zabbix_auto_trigger` - if set to `true`, your deployment will
    automatically execute `zabbix:create` before deploying code and
    `zabbix:delete` when it's finished. If set to `false` (default) you have
    to hook those tasks up where you think it's appropriate.

### Configuration defaults
```ruby
  set :zabbix_url,          'http://192.168.56.2/zabbix/'
  set :zabbix_user,         'Admin'
  set :zabbix_password,     'zabbix'
  set :zabbix_period,       60 * 60 * 10  # 10 hours
  set :zabbix_groupid,      2
  set :zabbix_auto_trigger, false
```

## Contributing to capistrano2-zabbix

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Feel free to submit PR :)

## Copyright

Copyright (c) 2015 Marek Skrobacki. See LICENSE.txt for
further details.

