# Mars movie_checker.gemspec
Gem::Specification.new do |s|
  s.name        = 'moviechecker'
  s.version     = '0.1.1'
  s.date        = '2010-04-28'
  s.summary     = "trending movies availible for streaming"
  s.description = "Uses Nokogiri to display the trending movies from streaming sites"
  s.authors     = ["Mars Howard"]
  s.email       = 'marsbhoward@gmail.com'
  s.files       = ["bin/moviechecker","config/environment.rb","lib/moviechecker.rb","lib/concerns/findable.rb","lib/command_Line_Interface.rb","lib/movie.rb","lib/scraper.rb","lib/stream.rb","CONTRIBUTING.md","Gemfile","Gemfile.Lock","LICENSE.md","README.md","Spec.md"]
  s.executables = ["moviechecker]
  s.homepage    ='https://github.com/marsbhoward/cli-movie-checker'
  s.license     = 'MIT'
end