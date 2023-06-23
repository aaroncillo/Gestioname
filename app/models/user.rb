class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # has manys

  has_many :companies, dependent: :destroy

  # Validaciones.

  validates :first_name, :last_name, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
end
