load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

require "bundler/capistrano"
load 'config/deploy' # remove this line to skip loading any of the default tasks
