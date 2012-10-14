@rvm = "rvm use 1.9.3"

# Create .rvmrc
file '.rvmrc', @rvm

# Make the .rvmrc trusted
run "rvm rvmrc trust #{@app_path}"

