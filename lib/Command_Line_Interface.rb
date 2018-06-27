class CommandLineInterface


	def call
		input = ""

		puts ""
		puts "Hello, and welcome to Movie Checker!"
		puts""
		Scraper.new.make_movies
		while input != "exit"
			puts "Main Menu"
			puts "To see all movies currently streaming enter 'list movies'."
			
			puts "To see all movies currently streaming on Netflix enter 'netflix'."
			puts "To see all movies currently streaming on Hulu enter 'hulu'."
			puts "to see the list of streaming services type 'list streams'."
			puts "To refresh the list of movies type 'refresh'."
			puts "To quit enter 'exit'."
			puts
			puts "What would you like to do?"
			
			input = gets.strip
			puts""

			def more_info(stream = "all")
				info = ""
				n=-1
				
				Stream.list_all("Netflix")
				netflix_Size = Stream.list.size
				Stream.list_clear
				
				Stream.list_all("Hulu")
				hulu_Size = Stream.list.size
				Stream.list_clear
				
				if stream == "all"
					while n <0 || n > (Movie.all.size-1) && info != "menu" 
						puts "enter the number of the movie you would like to see or type 'menu' to return"
						puts ""
						info = gets.strip
						n = info.to_i 
						if n < (netflix_Size) && n > 0
						get_netflix_movies_descriptions(n)
						elsif n >netflix_Size 
						n = n - netflix_Size
						get_hulu_movies_descriptions(n)						
						end
						puts ""
						n = -1
						############
						if info == "menu" 
							n = 0
						end
					end
				elsif stream == "Netflix"
					while n <0 || n > (netflix_Size) && info != "menu" 
						puts "enter the number of the movie you would like to see or type 'menu' to return"
						puts ""
						info = gets.strip
						n = info.to_i 
						if n > 0 
							get_netflix_movies_descriptions(n)
							puts ""
							n = -1
							############
							if info == "menu" 
								n = 0
							end
						end
					end
				else
					while n <0 || n > (Movie.all.size-1) && info != "menu" 
						puts "enter the number of the movie you would like to see or type 'menu' to return"
						puts ""
						info = gets.strip
						n = (info.to_i) +(netflix_Size) 
						if n >netflix_Size 
							n = n - netflix_Size
							get_hulu_movies_descriptions(n)						
						end
						puts ""
						n = -1
						############
						if info == "menu" 
							n = 0
						end
					end
				end
			end
			
			
			
			def refresh
				Movie.all.clear
				Scraper.new.make_movies
			end
			

			def print_movies
				i = 1
				puts "**********"
				puts ""
				puts "This was done i = 1"
				puts ""
				puts "**********"
				Movie.all.each do |movie|
				  puts "Movie #{i}"
				  if movie.title

					puts "  Title: #{movie.title}"
					puts "  stream: #{movie.stream}"
					i = i + 1
				  end
				end
				i = 1
				
			end				
			  
			def print_netflix
				i = 1
				Movie.all.each do |movie|


				  if movie.stream == "Netflix"
					puts "Movie #{i}"
					puts "  Title: #{movie.title}"
					puts "  stream: #{movie.stream}"
					i = i + 1
				  end
				end
				i = 1
				#Movie.all.clear
			end
			
			def get_netflix_movies_descriptions(n=1)
				grab = Scraper.new.get_netflix.css('.entry-content').css('script').first
				descriptions = []
				split =[]
				
				scription = grab.text
				split = scription.split('{"slug":')
				
				split.each do |description|
					descriptions << description
				end
	
				puts descriptions[n]
	
			end
			
			def get_hulu_movies_descriptions(n=1)
				grab1 = Scraper.new.get_hulu.css('.entry-content').css('script').first
				descriptions = []
				split =[]
				
				scription = grab1.text
				split = scription.split('{"slug":')
				
				split.each do |description|
					descriptions << description
				end
	
				puts descriptions[n]
			end
				
			def print_hulu
				i = 1
				Movie.all.each do |movie|


				  if movie.stream == "Hulu"
					puts "Movie #{i}"

					puts "  Title: #{movie.title}"
					puts "  stream: #{movie.stream}"
					i = i + 1
				  end
				end
				#Movie.all.clear
				i = 1
			end

			def print_streams
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
			
			def response(stream)
				reply = ""
				puts ""
				while reply != "yes" && reply != "no" 
					puts "would you like to see more info? yes/no"
					reply = gets.strip
					
					if reply == "yes"
					#puts""
					#puts"Enter the number of the movie you would like more info about."
					#n = 0
					#n = gets.strip.to_i
						more_info(stream)
					elsif  reply == "no"
					
					puts ""
					end
				end
			end
				
			case input
				
				when "list movies"
					print_movies
					response("all")
				when "netflix"
					print_netflix
					response("Netflix")
				when "hulu"
					print_hulu
					response("Hulu")
				when "list streams"
					print_streams
				when "refresh"
					refresh
					puts "the list has been refreshed"
			end
		end
	end
end
