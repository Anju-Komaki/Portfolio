class Comic < ApplicationRecord
	#picture
	attachment :comic_image

	#Relation
	belongs_to :user
	has_many :comments, dependent: :destroy
end
