remove_dir 'test'

gem_group :development, :test do
    gem "rspec-rails",  "~> 2.4"
end

run "bundle"
run "bundle exec rails generate rspec:install"
