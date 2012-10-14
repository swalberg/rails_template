# Directories for template partials and static files
@template_root = File.expand_path(File.join(File.dirname(__FILE__)))
@scripts     = File.join(@template_root, 'scripts')
@static_files = File.join(@template_root, 'files')

# Copy a static file from the template into the new application
def copy_static_file(path)
  remove_file path
  file path, File.read(File.join(@static_files, path))
end

# From "Suspenders" by thoughtbot
def concat_file(source, destination)
  contents = IO.read(find_in_source_paths(source))
  append_file destination, contents
end

def replace_in_file(relative_path, find, replace)
  path = File.join(destination_root, relative_path)
  contents = IO.read(path)
  unless contents.gsub!(find, replace)
    raise "#{find.inspect} not found in #{relative_path}"
  end
  File.open(path, "w") { |file| file.write(contents) }
end

def download_file(uri_string, destination)
  uri = URI.parse(uri_string)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true if uri_string =~ /^https/
  request = Net::HTTP::Get.new(uri.path)
  contents = http.request(request).body
  path = File.join(destination_root, destination)
  File.open(path, "w") { |file| file.write(contents) }
end

%w[cleanup rvm active_admin rspec bootstrap git].each do |script|
  apply "#{@scripts}/#{script}.rb"
end

