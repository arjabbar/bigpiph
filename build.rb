# Compile all stylus files
Dir['**/*.styl'].each { |file| system "stylus #{File.join Dir.pwd, file}" }
# Compile all coffee files
Dir['**/*.coffee'].each { |file| system "coffee -c #{File.join Dir.pwd, file}" }