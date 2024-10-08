class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :email, format: {with: /\A[\w+\-.]+@whitman\.edu\z/, message: "must be a Whitman College email address" }

  has_many :sticker_notes, dependent: :destroy

end
