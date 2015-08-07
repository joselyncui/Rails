class User < ActiveRecord::Base
	validates :name, presence: true, length:{maximum:50}
	validates :email, presence: true, length:{maximum:255}
	
	has_secure_password
	validates :password, length:{minimum:6}
	
	has_many :votes
	has_many :ideas, through: :votes

	# 返回指定字符串的哈希摘要
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
end
