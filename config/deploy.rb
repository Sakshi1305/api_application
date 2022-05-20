# config valid for current version and patch releases of Capistrano
lock "~> 3.17.0"

set :application, "api_application"

set :repo_url, "git@github.com:Sakshi1305/api_application.git"

set :branch, :master

set :deploy_to, '/home/deploy/api_application'

set :pty, true

set :linked_files, %w{config/database.yml config/application.yml}

set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads node_modules client/node_modules}

set :keep_releases, 5

set :rvm_type, :user

set :rvm_ruby_version, 'ruby-2.6.6' # Edit this if you are using different Ruby version

set :user, "deploy"

set :nvm_type, :user

set :nvm_node, 'v10.13.0' #set your node version

set :nvm_map_bins, %w{node npm yarn}

set :yarn_target_path, -> { release_path.join('client') } #

set :yarn_flags, ' — production — silent — no-progress' # default

set :yarn_roles, :all #default set :yarn_env_variables, {}

set :puma_rackup, -> { File.join(current_path, 'config.ru') }

set :puma_state, "#{shared_path}/tmp/pids/puma.state"

set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"

set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock" #accept array for multi-bind

set :puma_conf, "#{shared_path}/puma.rb"

set :puma_access_log, "#{shared_path}/log/puma_error.log"

set :puma_error_log, "#{shared_path}/log/puma_access.log"

set :puma_role, :app

set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))

set :puma_threads, [0, 8]

set :puma_workers, 0

set :puma_worker_timeout, nil

set :puma_init_active_record, true

set :puma_preload_app, false

set :default_env, {
  PATH: '$HOME/.npm-packages/bin/:$PATH',
  NODE_ENVIRONMENT: 'production'
}

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
