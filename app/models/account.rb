class Account < ActiveRecord::Base
  devise :database_authenticatable, :authentication_keys => [ :username ]
  devise :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :mods

  validates :username, presence: true,
  					   length: { in: 5..25 },
  					   uniqueness: true

  validates :first_name, presence: true,
  					     length: { in: 1..50 }
  validates :last_name, presence: true,
  					     length: { in: 1..50 }

  validates :country, presence: true
end
