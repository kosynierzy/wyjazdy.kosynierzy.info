require "mina/bundler"
require "mina/rails"
require "mina/git"
require "mina/rbenv"  # for rbenv support. (http://rbenv.org)
# require "mina/rvm"    # for rvm support. (http://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :domain, "baratheon"
set :deploy_to, "/home/account/apps/wyjazdy"
set :repository, "git://github.com/kosynierzy/kosynierzy.info.git"
set :branch, "master"
set :bundle_bin, "./bin/bundle"
set :bundle_options, lambda { %{--without development:test --path "#{bundle_path}" --deployment} }
settings.rake_assets_precompile = lambda { "#{rake} assets:precompile" }

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the "deploy:link_shared_paths" step.
set :shared_paths, ["config/database.yml", "log", "tmp", "config/application.yml", "Passengerfile.json"]

# Optional settings:
set :user, "account"    # Username in the server to SSH to.
#   set :port, "30000"     # SSH port number.
set :forward_agent, true

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .rbenv-version to your repository.
  invoke :"rbenv:load"

  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :"rvm:use[ruby-1.9.3-p125@default]"
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue! %[touch "#{deploy_to}/shared/config/application.yml"]
  queue! %[touch "#{deploy_to}/shared/Passengerfile.json"]

  queue! %[mkdir -p "#{deploy_to}/shared/tmp"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp"]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :"git:clone"
    invoke :"deploy:link_shared_paths"
    invoke :"bundle:install"
    invoke :"rails:db_migrate"
    invoke :"rails:assets_precompile"

    to :launch do
      queue "touch #{deploy_to}/#{shared_path}/tmp/restart.txt"
    end
  end
end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers

