class Mod < ActiveRecord::Base
	belongs_to :account

	#belongs_to :category
	#has_and_belongs_to_many :tags

  acts_as_votable # Likes / Dislikes

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

	validates :name, presence: true, length: { in: 1..30 }
	validates :description, presence: true, length: { in: 1..500 }
	
	validates :version, presence: true
	validates :tags, presence: true
	validates :download_count, presence: true

  def vote_tally
    self.likes.size - self.dislikes.size
  end
end
