# Compile all stylus files
Dir['**/*.styl'].each { |file| system "stylus #{File.join Dir.pwd, file}" }
# Compile all coffee files
Dir['**/coffeescript/*.js'].each { |file| system "rm #{File.join Dir.pwd, file}" }
Dir['**/*.coffee'].each { |file| system "coffee -o js -c #{File.join Dir.pwd, file}" }