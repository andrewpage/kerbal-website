class Mod < ActiveRecord::Base
	belongs_to :account
  has_and_belongs_to_many :subscribed_accounts, class_name: 'Account'

  enum mod_type: [ :plugin, :part, :craft ]

  # Paperclip
  has_attached_file :thumbnail, styles: { thumb: '320x150#' }
  has_attached_file :banner, styles: { medium: '800x300#' }
  has_attached_file :mod

  after_thumbnail_post_process :rename_thumbnail
  after_banner_post_process :rename_banner

  before_save :rename_mod_file


	#belongs_to :category
	#has_and_belongs_to_many :tags

  acts_as_votable # Likes / Dislikes

  acts_as_taggable

  searchkick # Search Engine

  # Thumbnail
  validates_attachment_presence :thumbnail
  validates_attachment_content_type :thumbnail, :message => 'is an invalid image format. Accepted formats: ' + Settings.file_upload.allowed.image.to_s, :content_type => Settings.file_upload.allowed.image

  # Banner
  validates_attachment_presence :banner
  validates_attachment_content_type :banner, :message => 'is an invalid image format. Accepted formats: ' + Settings.file_upload.allowed.image.to_s, :content_type => Settings.file_upload.allowed.image

  # Mod File
  validates_attachment_presence :mod
  validates_attachment_content_type :mod, :message => 'is an invalid archive format. Accepted formats: ' + Settings.file_upload.allowed.archive.to_s, :content_type => Settings.file_upload.allowed.archive
  validates_attachment_size :mod, :less_than => 200.megabytes

  # Validations

	validates :name, presence: true, length: { in: 1..30 }
	validates :description, presence: true, length: { in: 1..3000 }
  validates :description_short, presence: true, length: { in: 1..100 }
	validates :version, presence: true

  validates :youtube_url, presence: true, url: true

  def vote_tally
    self.likes.size - self.dislikes.size
  end

  private
  def rename_thumbnail
    extension = File.extname(thumbnail_file_name).downcase
    self.thumbnail.instance_write :file_name, "#{Time.now.to_i.to_s}#{extension}"

  end

  def rename_banner
    extension = File.extname(banner_file_name).downcase
    self.banner.instance_write :file_name, "#{(Time.now.to_i + 1).to_s}#{extension}"
  end

  def rename_mod_file
    name = File.basename(mod_file_name).downcase
    extension = File.extname(mod_file_name).downcase
    self.mod.instance_write :file_name, "#{Time.now.to_i.to_s}_#{name}#{extension}"
  end
end
