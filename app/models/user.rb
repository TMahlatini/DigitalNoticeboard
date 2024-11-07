class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :confirmable

  validates :email, format: {with: /\A[\w+\-.]+@whitman\.edu\z/, message: "must be a Whitman College email address" }

  has_many :sticker_notes, dependent: :destroy

  def self.create_admin_user
    find_or_create_by(email: Rails.application.credentials.admin_email) do |user|
      user.password = Rails.application.credentials.admin_password
      user.skip_confirmation! if user.respond_to?(:skip_confirmation!)
      user.confirmed_at = Time.now
      user.admin = true
    end
  end

  def self.admin_user
    find_by(admin: true) || create_admin_user
  end

end
