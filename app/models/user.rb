class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :omniauthable, omniauth_providers: [:google_oauth2]

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

  def self.from_google(user_params)
    create_with(
      provider: user_params[:provider],
      uid: user_params[:uid],
      email: user_params[:email],
      password: Devise.friendly_token[0, 20]
    ).find_or_create_by(email: user_params[:email])
  end

  

  

end
