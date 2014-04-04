class Mod < ActiveRecord::Base
	belongs_to :account

	#belongs_to :category
	#has_and_belongs_to_many :tags

	validates :name, presence: true, length: { in: 1..30 }
	validates :description, presence: true, length: { in: 1..500 }
	
	validates :version, presence: true
	validates :tags, presence: true
	validates :download_count, presence: true
end
