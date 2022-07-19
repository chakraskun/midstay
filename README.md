# Midstay Flats

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

```
Ruby 3.1.0
Rails 7.0.3
Redis
```

### Installing

You need to have Ruby and Rails installed on your system

Install Ruby
```
https://www.ruby-lang.org/en/downloads/
```

Install Rails
```
https://guides.rubyonrails.org/v5.0/getting_started.html

```

Install Redis
```
https://redis.io/download/

```

### Make it work on your local machine
After all the prerequisites installed, then you can open terminal and then do
```
clone repo
cd midstay
rails db:setup
rails db:migrate
rails dummies:neighbor
rails s
```

PLEASE MAKE SURE REDIS-SERVER IS RUNNING ON YOUR SYSTEM BY DOING
```
redis-server
```
## Built With

* [Ruby](https://www.ruby-lang.org/en/) - Language
* [Rails](https://rubyonrails.org/) - Framework
