#!/bin/bash
bundle exec rails db:migrate
bundle exec rails assets:precompile
bundle exec rails dummies:neighbor
