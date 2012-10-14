gem "activeadmin"
run "bundle install"
generate "active_admin:install"
rake "db:migrate"
