class Idea < ActiveRecord::Base
	mount_uploader :picture, PictureUploader

	has_many :votes
	has_many :users, through: :votes
end
