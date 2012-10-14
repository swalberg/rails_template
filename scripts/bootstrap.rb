gem "twitter-bootstrap-rails"
run "bundle install"
generate "bootstrap:install"
generate "bootstrap:layout application fixed"
# modify application.scss
inject_into_file "app/assets/stylesheets/application.css", "\n  *= require bootstrap_and_overrides\n", :before => "*= require_self"
