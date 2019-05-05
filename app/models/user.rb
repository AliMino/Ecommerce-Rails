class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { minimum: 5 }
  validate :validate_avatar

  has_one :store
  has_one_attached :avatar
  enum role: { admin: 2, seller: 1, buyer: 0 }


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

  def self.get_all_sellers
    sellers = []
    User.all.each do |user|
      if user.role == "seller"
        sellers.append user
      end
    end
    sellers
  end

  def self.get_sellers_names
    names = []
    User.all.each do |user|
      if user.role == "seller"
        names.append user.name
      end
    end
    names
  end

  def self.get_seller_by_name(seller_name)
    User.where("name = ?", seller_name).limit(1).first
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
