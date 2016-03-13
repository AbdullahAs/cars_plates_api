# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'cars_plates_api'
set :deploy_to, "/home/deploy/apps/cars_plates_api"
set :deply_via, :remote_cache
set :use_sudo, false

set :scm, :git
set :repo_url, 'git@github.com:AbdullahAs/cars_plates_api.git'
set :branch, "master"

set :pty, true
set :format, :pretty

after 'deploy', 'deploy:cleanup'
