class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :webpages

  # Favorite recipes of user
  has_many :favs # just the 'relationships'
  has_many :favorites, through: :favs, source: :webpage # the actual recipes a user favorites  before_create :set_default_role
  
  def admin?
    # user = self

    # puts self.inspect
    # user = User.first
    # puts user.role_id.inspect
    role_id == 3 # If you have id == 0 for admin
  end

  private
  def set_default_role
    self.role ||= Role.find_by_name('registered')
  end

end
