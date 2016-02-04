class User < ActiveRecord::Base
	has_secure_password

  before_save { self.email = email.downcase }
  before_save { self.userName = userName.downcase }

  has_many :upvotes, dependent: :destroy
  has_many :downvotes, dependent: :destroy

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :first_name, :last_name, :email, :userName, :password,
    presence: true,
    length: { maximum: 255 }
  VALID_EMAIL_REGEX = /\A[\w+\-.\+]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :userName,
    uniqueness: { case_sensitive: false }
  VALID_PASSWORD_REGEX = /[a-zA-Z0-9]+/
  validates :password,
    length: { minimum: 8 },
    format: { with: VALID_PASSWORD_REGEX }

  def to_param
    userName
  end

	def self.confirm(params)
	  @user = User.find_by({email: params[:email]})
	  @user.try(:authenticate, params[:password])
	end

end