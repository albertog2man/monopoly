class Property
	attr_accessor :next, :prev
	# @@all_properties = []
	def initialize(name,location,price,can_buy = true,is_owned=false,adds_or_takes=nil)
		@name = name
		@location = location
		@price = price
		@can_buy = can_buy
		@is_owned = is_owned
		@adds_or_takes = adds_or_takes
		# @@all_properties << self 
	end
	def get_property_location
		@location
	end
	def get_can_buy
		@can_buy
	end
	def get_is_owned
		@is_owned
	end
	def get_name
		@name
	end
	def get_price
		@price
	end
	def own
		@is_owned = true
	end
	def get_adds_or_takes
		@adds_or_takes
	end
	def set_adds_or_takes(money)
		@adds_or_takes = money
	end
end

# @@all_properties.each do |property|
# 	if property.name == "Baltic"
# 		# do something

# 	end
#end

