class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { minimum: 5 }
  validate :validate_avatar

  has_one_attached :avatar

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