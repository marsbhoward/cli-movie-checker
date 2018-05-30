class CommandLineInterface


	def call
		input = ""


		puts "Welcome to Movie Checker!"
		while input != "exit"
			puts "Main Menu"
			puts "To see all movies currently streaming enter 'list movies'."
			puts "To see all movies currently streaming on Netflix enter 'netflix'."
			puts "To see all movies currently streaming on Hulu enter 'hulu'."
			puts "to see the list of streaming services type 'list streams'"
			puts "To quit enter 'exit'."
			puts
			puts "What would you like to do?"

			input = gets.strip


			def print_movies
				Scraper.new.make_movies
				i = 1
				Movie.all.each do |movie|
				  puts "Movie #{i}"
				  if movie.title

					puts "  Title: #{movie.title}"
					puts "  stream: #{movie.stream}"
					i = i + 1
				  end
				end
				Movie.all.clear
			end
			  
			def print_netflix
				Scraper.new.make_movies
				i = 1
				Movie.all.each do |movie|


				  if movie.stream == "Netflix"
					puts "Movie #{i}"
					puts "  Title: #{movie.title}"
					puts "  stream: #{movie.stream}"
					i = i + 1
				  end
				end
				Movie.all.clear
			end
				
				def print_hulu
					Scraper.new.make_movies
					i = 1
					Movie.all.each do |movie|


					  if movie.stream == "Hulu"
						puts "Movie #{i}"

						puts "  Title: #{movie.title}"
						puts "  stream: #{movie.stream}"
						i = i + 1
					  end
					end
					Movie.all.clear
				end

				def print_streams
					Scraper.new.make_movies

					streams = []
					Movie.all.each do |movie|
					  if movie.title

						streams << movie.stream unless streams.include?(movie.stream)
					  end
					end
					puts
					puts streams
					puts
				end
				
			case input
				when "list movies"
					print_movies
				when "netflix"
					print_netflix
				when "hulu"
					print_hulu
				when "list streams"
					print_streams
			end
		end
	end
end
