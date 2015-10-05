class Player
	def initialize(name =nil,token=nil, money =1500,position=nil,property =[])
		@name = name
		@token = token
		@money = money
		@position = position
		@property = property
	end

	def give_name(name_given)
		@name = name_given
	end

	def give_token(token_given)
		case token_given
		when "1"
			@token = "🚗"
		when "2"
			@token = "👞"
		when "3"
			@token = "🐕"
		when "4"
			@token = "🎩"
		when "5"
			@token = "⛵️"
		# when "6"
		# 	@token = "💰"
		else
			puts "No idiot! your token is a = 💰"
			@token = "💰"
		end
	end

	def get_token
		@token
	end

	def set_location(position)
		@position = position
	end

	def get_location
		@position
	end

	def get_owned
		@property
	end
	def get_money
		@money
	end
	def subtract_money(new_money)
		@money -= new_money
	end
	def add_money(new_money)
		@money += new_money

	end
	attr_accessor :name
end






albert = Player.new("albert","💰",)

puts albert.name
puts albert.name = "josh"