class Mod < ActiveRecord::Base
	belongs_to :account
  has_and_belongs_to_many :subscribed_accounts, class_name: 'Account'

	#belongs_to :category
	#has_and_belongs_to_many :tags

  acts_as_votable # Likes / Dislikes

  acts_as_taggable

  searchkick

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  has_attached_file :mod_file
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  # Validations

	validates :name, presence: true, length: { in: 1..30 }
	validates :description, presence: true, length: { in: 1..3000 }
  validates :description_short, presence: true, length: { in: 1..100 }
	validates :version, presence: true

  validates :youtube_url, presence: true, url: true

  def vote_tally
    self.likes.size - self.dislikes.size
  end
end
