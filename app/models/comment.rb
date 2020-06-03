class Comment < ApplicationRecord
	#Relation
	belongs_to :user
	belongs_to :comic

	#validation
	validates :comment, presence: true
end
