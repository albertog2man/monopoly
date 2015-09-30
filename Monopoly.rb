require "./Player.rb"
require "./Property.rb"
class Monopoly

	@@positions_on_board = [

		[44, 105], #1
		[46, 94], #2
		[46, 85], #3
		[46, 76], #4
		[46, 67], #5
		[46, 58], #6
		[46, 49], #7
		[46, 39], #8
		[46, 31], #9
		[46, 22], #10
		[49, 13], #11
		[41, 7], #12
		[37, 7], #13
		[33, 7], #14
		[29, 7], #15
		[25, 7], #16
		[21, 7], #17
		[17, 7], #18
		[13, 7], #19
		[9, 7], #20
		[3, 8], #21
		[3, 21], #22
		[3, 30], #23
		[3, 39], #24
		[3, 48], #25
		[3, 57], #26
		[3, 66], #27
		[3, 75], #28
		[3, 85], #29
		[3, 94], #30
		[3, 101], #31
		[9, 105], #32
		[13, 105], #33
		[17, 105], #34
		[21, 105], #35
		[25, 105], #36
		[29, 105], #37
		[33, 105], #38
		[37, 105],#39
		[41, 105] #40	
	]

	def get_input 
		gets.chomp.downcase
		
	end

	def make_board
		@board = File.readlines("monopoly.txt","r+")
		@board = @board[0].split("\n")
		@board.map! do |x|
			x.chars
		end
	end

	def start_game 
		set_up
		@@player = Player.new
		initialize_board
		puts "----Enter Name----"

		@@player.give_name(get_input)
		puts "which token would you like?"
		puts "Type the corrisponding number"
		puts "🚗  👞  🐕  🎩  ⛵️  💰"
		puts "1  2  3  4  5  6"
		@@player.give_token(get_input)
		set_position(@go)
		play
	end

	def set_up
		@go = Property.new("go",0,nil,false)
		@med = Property.new("Mediterranean",1,60)
		@com1 = Property.new("Com.Chest",2,nil,false)
		@baltic = Property.new("Baltic",3,60)
		@income = Property.new("Income Tax",4,nil,false)
		@readingRR = Property.new("Reading RailRoad",5,200)
		@oriental = Property.new("Oriental Avenue",6,100)
		@chance1 = Property.new("Chance",7,nil,false)
		@vermont = Property.new("Vermont Avenue",8,100)
		@connec = Property.new("Connecticut Avenue",9,120)
		@visitJail = Property.new("Visiting Jail",10,nil,false)
		@stCharles = Property.new("St.Charles Place",11,140)
		@electric = Property.new("Electric Company",12,150)
		@state = Property.new("State Avenue",13,140)
		@virg = Property.new("Virginia Avenue",14,160)
		@penRR = Property.new("Pensylvania RailRoad",15,200)
		@stJames = Property.new("St.James Avenue",16,180)
		@com2 = Property.new("Community Chest",17,nil,false)
		@tennes = Property.new("Tennessee Avenue",18,180)
		@ny = Property.new("New York Avenue",19,200)
		@freepark = Property.new("Free Parking",20,nil,false)
		@ken = Property.new("Kentucky Avenue",21,220)
		@chance2 = Property.new("Chance",22,nil,false)
		@indian = Property.new("Indian Avenue",23,220)
		@illinois = Property.new("Illinois Avenue",24,240)
		@bORR = Property.new("B & O RailRoad",25,200)
		@atlantic = Property.new("Atlantic Avenue",26,260)
		@veninor = Property.new("Veninor Avenue",27,260)
		@water = Property.new("Water Works",28,150)
		@marvin = Property.new("Marvin Gardens",29,280)
		@goToJail = Property.new("Go To Jail",30,nil,false)
		@pacific = Property.new("Pacific Avenue",31,300)
		@northcaro = Property.new("North Carolina Avenue",32,300)
		@com3 = Property.new("Community Chest",33,nil,false)
		@penAve = Property.new("Pennsylvania Avenue",34,320)
		@shortRR = Property.new("Short Line RailRoad",35,200)
		@chance3 = Property.new("Chance",36,nil,false)
		@parkPl = Property.new("Park Place",37,350)
		@luxTax = Property.new("Luxury Tax",38,nil,false)
		@boardWalk = Property.new("Board Walk",39,400)
		#

		# name_cost = [
		# 	["Baltic", 80]
		# ]
		# n = 1
		# name_cost.each do |i|
		# 	p = Property.new(i[0], i[1], n)
		# 	n += 1
		# end
		#{ index: n, name: "Baltic", cost: 80 }
		#-------------------------------------
		@go.prev = @baodWalk
		@med.prev = @go
		@com1.prev = @med
		@baltic.prev = @com1
		@income.prev = @baltic
		@readingRR.prev = @income
		#--------------------------------
		@go.next = @med
		@med.next = @com1
		@com1.next = @baltic
		@baltic.next = @income
		@income.next = @readingRR
		@readingRR.next = @oriental
		@oriental.next = @chance1
		@chance1.next = @vermont
		@vermont.next = @connec
		@connec.next = @visitJail
		@visitJail.next = @stCharles
		@stCharles.next = @electric
		@electric.next = @state
		@state.next = @virg
		@virg.next = @penRR
		@penRR.next = @stJames
		@stJames.next = @com2
		@com2.next = @tennes
		@tennes.next = @ny
		@ny.next = @freepark
		@freepark.next = @ken
		@ken.next = @chance2
		@chance2.next = @indian
		@indian.next = @illinois
		@illinois.next = @bORR
		@bORR.next = @atlantic
		@atlantic.next = @veninor
		@veninor.next = @water
		@water.next = @marvin
		@marvin.next = @goToJail
		@goToJail.next = @pacific
		@pacific.next = @northcaro
		@northcaro.next = @com3
		@com3.next = @penAve
		@penAve.next = @shortRR
		@shortRR.next = @chance3
		@chance3.next = @parkPl
		@parkPl.next = @luxTax
		@luxTax.next = @boardWalk
		@boardWalk.next = @go

		@income.set_adds_or_takes(-200)
		@luxTax.set_adds_or_takes(-75)

		@@cpu = Player.new("cpu","💻",1500,@go)
	end
	def move(dice_roll,player)
		passed_go = false
		player.set_location(player.get_location)
		positions_index = player.get_location.get_property_location
		move_player_spot = @@positions_on_board[positions_index]
		@board[move_player_spot[0]][move_player_spot[1]] = " "
		dice_roll.times do |i|
			player.set_location(player.get_location.next)
			if player.get_location.get_name == "go"
				player.add_money(200)
				passed_go = true
			end
		end
		positions_index = player.get_location.get_property_location
		move_player_spot = @@positions_on_board[positions_index]
		@board[move_player_spot[0]][move_player_spot[1]] = player.get_token
		print_board
		if passed_go == true
			puts "You passed GO -- +200"
		end

	end
	@@dice  = 0
	@@input = nil
	@@show_property = false
	@@after_first = false
	@@cpu_dice = 0
	@@if_bought = false
	def play
		if @@after_first == true
			puts "CPU moved #{@@cpu_dice} spaces"
		end
		if @@if_bought = true
			puts "CPU bought #{@@cpu.get_location.get_name}"
		end
		if @@dice > 0
			puts "You rolled a #{@@dice}"
		end
		if @@player.get_location.get_adds_or_takes != nil
			puts "You landed on #{@@player.get_location.get_name}"
			if @@player.get_location.get_adds_or_takes < 0
				puts "You lost $#{@@player.get_location.get_adds_or_takes}"
			else
				puts "You gained #{@@player.get_location.get_adds_or_takes}"
			end
			@@player.add_money(@@player.get_location.get_adds_or_takes)
		end
		puts "You have: $#{@@player.get_money}"
		if @@show_property == true
			puts "You own:"
			@@player.get_owned.each do |i|
				print "#{i}, "
			end
			puts ""
		end
		puts "Type \"roll\" to roll dice"
		if @@player.get_location.get_can_buy == true && @@player.get_location.get_is_owned == false
			puts "Type \"buy\" if you would like to buy #{@@player.get_location.get_name}"
		end
		if @@player.get_owned.length > 0
			puts "Type \"property\" to see your properties"
		end
		puts "Type \"end\" to quit"
		@@input = get_input
		if @@input == "roll"
			@@dice = Random.rand(12) + 1
			move(@@dice,@@player)
		elsif @@input == "buy"
			buy(@@player)
			print_board
			puts "You have bought #{@@player.get_location.get_name}!"
			play
		elsif @@input == "property"
			@@show_property = true
		end
		if @@input != "end"
			cpu_turn
		else
			puts "loser!"
		end
	end

	def set_position(property)
		@@player.set_location(property)
		positions_index = property.get_property_location 
		move_player_spot = @@positions_on_board[positions_index]
		@board[move_player_spot[0]][move_player_spot[1]] = @@player.get_token
		print_board

	end
	def print_board
		@board.each_index do |i|
			@board[i].each_index do |j|
				print @board[i][j]
			end
			puts ""
		end
	end
	def buy(player)
		if player.get_money - player.get_location.get_price > 0
	 		player.get_owned << player.get_location.get_name
	 		player.subtract_money(player.get_location.get_price)
	 		player.get_location.own

	 	end
	end 
		
	def initialize_board
		make_board 
		@board.each_index do |i|
			@board[i].each_index do |j|
				print @board[i][j]
			end
			puts ""
		end
	end 
	def exit
	end
	def cpu_turn
		if @@cpu.get_location.get_adds_or_takes != nil
			puts "CPU landed on #{@@player.get_location.get_name}"
			if @@cpu.get_location.get_adds_or_takes < 0
				puts "CPU lost $#{@@cpu.get_location.get_adds_or_takes}"
			end
			@@cpu.add_money(@@cpu.get_location.get_adds_or_takes)
		end
		if @@cpu.get_location.get_can_buy == true && @@cpu.get_location.get_is_owned == false
			fiftyFifty = Random.rand(2) + 1
			if fiftyFifty == 1
				buy(@@cpu)
				@@if_bought = true
			end
		end
		@@cpu_dice = Random.rand(12) + 1
		move(@@cpu_dice,@@cpu)
		@@after_first = true
		play
	end
end
game = Monopoly.new
game.start_game
