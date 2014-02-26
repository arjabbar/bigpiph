ROOT_DIRECTORY = Dir.pwd

desc "The default task."
task :default do
  # Compile all stylus files
  Dir['**/*.styl'].each { |file| system "stylus #{File.join ROOT_DIRECTORY, file}" }
  # Compile all coffee files
  Dir['**/coffeescript/*.js'].each { |file| system "rm #{File.join ROOT_DIRECTORY, file}" }
  Dir['**/*.coffee'].each { |file| system "coffee -o js -c #{File.join ROOT_DIRECTORY, file}" }
end