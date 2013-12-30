class User < ActiveRecord::Base
  attr_accessible :voted_looks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :looks
  has_many :votes
  has_many :voted_looks, through: :votes, source: :look
  
  def self.from_omniauth(auth)
    User.where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      
      user.email = auth.info.email if auth.info.email
      user.gender = auth.info.gender if auth.info.gender
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
  
  def password_required?
    super && provider.blank?
  end

  def email_required?
    super && provider.blank?
  end
end
