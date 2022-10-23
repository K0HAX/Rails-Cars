set :application, 'CarApp'
set :repo_url, 'https://github.com/K0HAX/Rails-Cars.git'

# require "bundler/capistrano"
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# set :deploy_to, '/var/www/my_app'
set :deploy_to, "/opt/deploy/CarApp"
#set :scm, :git
#set :deploy_via, :remote_cache

#set :user, "deploy"

set :rvm1_ruby_version, '2.5.9@cars'

before 'deploy', 'rvm1:install:rvm'  # install/update RVM
before 'deploy', 'rvm1:install:ruby' # install Ruby and create gemset
before 'deploy', 'rvm1:install:gems'

# set :format, :pretty
# set :log_level, :debug
set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :linked_dirs, fetch(:linked_dirs, []) << '.bundle'

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :rvm1 do # https://github.com/rvm/rvm1-capistrano3/issues/45
  desc "Setup bundle alias"
  task :create_bundle_alias do
    on release_roles :all do
      execute %Q{echo "alias bundle='#{fetch(:rvm1_auto_script_path)}/rvm-auto.sh . bundle'" > ~/.bash_aliases}
    end
  end
end
after "rvm1:install:rvm", "rvm1:create_bundle_alias"

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  task :symlink_db do
    on roles(:app) do
       execute "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml" # This file is not included repository, so we will create a symlink 
    end
  end

  after 'deploy:updated', 'deploy:migrate'
  before 'deploy:assets:precompile', 'deploy:symlink_db' # callback: run this task before deploy:assets:precompile

  after :finishing, 'deploy:cleanup'

end

set :keep_releases, 5
after "deploy:restart", "deploy:cleanup" 
