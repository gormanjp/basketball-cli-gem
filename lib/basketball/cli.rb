class Basketball::CLI

	def call
		puts "Top 25 NCAAM Basketball Teams"
		create_teams
		list_teams
		list_menu
	end

	def create_teams
		Basketball::Team.create_teams
	end

	def list_teams
		@teams = Basketball::Team.all
		@teams.each.with_index(1) do |team, i|
			puts "#{i}. #{team.name}"
		end
	end

	def list_menu
		puts "Which team would you like to know more about? (Enter: 1-25, list, or exit)"
		input = gets.strip.downcase
			
		if input.to_i > 0
			team_menu(input)
		elsif input == "list"
			list_teams
		elsif input == "exit"
			goodbye	
		else
			puts "Try again!"
		end
	end

	def team_menu(input)
		selected_team = @teams[input.to_i - 1]
		selected_team.scrape_team_page
		puts ""
		puts ""
		puts "-------------#{selected_team.name} - Record: #{selected_team.record}-------------"
		puts ""
		puts "Would you like more info?"
		puts "Enter 'news' for the latest headline or tweet, 'schedule' to see when the team's next game is, 'list' to go back to the top 25 list, or 'exit'"
		input2 = gets.strip.downcase
		if input2 == "list" || input2 == "back"
			list_teams
			list_menu
		elsif input2 == "news"
			puts ""
			puts "#{selected_team.tweet}"
			puts ""
			puts ""
		elsif input2 == 'exit'
			goodbye
		end
	end

	def goodbye
		puts "Goodbye!"
	end
end