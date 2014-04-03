class Account < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #has_many :items

  validates :username, presence: true,
  					   length: { in: 5..25 },
  					   uniqueness: true

  validates :first_name, presence: true,
  					     length: { in: 5..25 }
  validates :last_name, presence: true,
  					     length: { in: 5..25 }

  validates :country, presence: true
end
