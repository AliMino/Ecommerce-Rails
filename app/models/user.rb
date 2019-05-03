class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { minimum: 5 }
  validate :validate_avatar
  # after_create :create_cart

  has_one_attached :avatar
  has_one :shopping_cart
  # has_one :ShoppingCart
  enum role: { admin: 2, seller: 1, buyer: 0 }
  after_create :createCart
  def self.assign_role(user, role)
    user.role = role
    user.save
  end

  def self.get_all_buyers
    buyers = []
    User.all.each do |user|
      if user.role == "buyer"
        buyers.append user
      end
    end
    buyers
  end

  def createCart
 #   self.inspect
 ShoppingCartsController.create
  end  

  

  def self.get_all_sellers
    sellers = []
    User.all.each do |user|
      if user.role == "seller"
        sellers.append user
      end
    end
    sellers
  end

  private

    def validate_avatar
      if avatar.attached?
        unless avatar.content_type.in?(%('image/jpeg image/png'))
          errors.add(:avatar, "has a not supported format, only JPEG and PNG are supported")
        end
      else
        errors.add(:avatar, "must be uploaded")
      end
      puts self.inspect
    end

end
