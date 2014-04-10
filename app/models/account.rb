class Account < ActiveRecord::Base
  devise :database_authenticatable, :authentication_keys => [ :username ]
  devise :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :mods, dependent: :destroy

  has_and_belongs_to_many :subscribed_mods, class_name: 'Mod'

  acts_as_voter

  validates :username, presence: true,
  					   length: { in: 5..25 },
  					   uniqueness: true

  validates :first_name, presence: true,
  					     length: { in: 1..50 }
  validates :last_name, presence: true,
  					     length: { in: 1..50 }

  validates :country, presence: true

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def mailboxer_email(object)
    (Rails.env == 'development') ? nil : email
  end

  def gravatar_url
    gravatar_id = Digest::MD5.hexdigest(self.email.downcase)
    "http://www.gravatar.com/avatar/#{gravatar_id}?s=100"
  end
end
