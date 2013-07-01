set :application, "AAA"
set :domain,      "xxx.xxx.xxx.xx"
set :repository,  "git@github.com:Aurametrix/Hist.git"
set :scm,         "git"
set :branch,      "master"
set :deploy_via,  :remote_cache
set :use_sudo,    false
set :deploy_to,   "/opt/webapps/#{application}"
 
ssh_options[:forward_agent] = true

role :app, domain
role :web, domain
role :db,  domain, :primary => true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end


set :whenever_command, "bundle exec whenever"
require "whenever/capistrano"

after 'deploy', 'deploy:cleanup'
