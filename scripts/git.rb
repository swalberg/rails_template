append_file '.gitignore', <<-CODE.gsub(/^\s*/, '')
  .DS_Store
  mkmf.log
  log
  coverage
  rdoc
  .bundle
  tmp
  db/*.sqlite3
  config/database.yml
  public/stylesheets/compiled/*
  public/system/*
CODE

git :init
git :add => "."
git :commit => "-aqm 'Initial commit.'"

puts "\n"

