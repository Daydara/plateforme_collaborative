class User < ApplicationRecord

  enum user_category: [:grower, :gardner, :individual, :professional, :other]

# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :categories

  has_many :products




end
