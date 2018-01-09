class Customer < ApplicationRecord
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true
  validates_presence_of :name
  validates_presence_of :surname
  validates_presence_of :country
  validates_presence_of :city
  validates_presence_of :street
  validates_presence_of :house_number
  validates_presence_of :phone_number
end
