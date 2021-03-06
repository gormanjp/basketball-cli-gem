class Basketball::Team

	attr_accessor :name, :record, :url, :tweet, :schedule

	@@all = []

	def initialize(name = nil, record = nil, url = nil)
		@name = name
		@record = record
		@url = url
		@@all << self
	end

	def self.all
		@@all
	end

	def self.scrape_rankings
		doc = Nokogiri::HTML(open("http://espn.go.com/mens-college-basketball/rankings"))
		doc.search("table.tablehead tr")[2..26]
	end

	def self.create_teams
		self.scrape_rankings.each do |team|
				n = team.css('a').text
				r = team.search("td:nth-child(3)").text
				url = team.search('a').attribute('href').value
				Basketball::Team.new(n, r, url)
		end
	end

	def scrape_team_page
		doc = Nokogiri::HTML(open("#{self.url}"))
		@tweet = doc.search('article.news-feed-tweet').first.search('p').text
		@schedule = []
		info = doc.search('section.club-schedule li a.upcoming').first
		@schedule << info.search('div.game-info').text
		@schedule << info.search('div.game-meta div.game-date span').text
		#EST time conversion
		time = info.search('div.time').text
		if time.length == 7
			hour = time[0].to_i + 3
			time[0] = hour.to_s
			@schedule << time.gsub("AM","PM")
		elsif time.length == 8
			hour = time[0..1].to_i - 9 
			time[0..1] = hour.to_s
			@schedule << time.gsub("AM","PM")
		end
				
	end

end