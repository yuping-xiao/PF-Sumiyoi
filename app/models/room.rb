class Room < ApplicationRecord

	enum living_status:{
		_1年未満: 0,
		_1年以上_3年未満: 1,
		_3年以上_5年未満: 2,
		_5年以上: 3
	}
end
