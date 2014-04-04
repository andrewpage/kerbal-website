class Mod < ActiveRecord::Base
	belongs_to :account

	#belongs_to :category
	#has_and_belongs_to_many :tags
end
