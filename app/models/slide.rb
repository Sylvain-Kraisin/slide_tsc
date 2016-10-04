class Slide < ApplicationRecord
  include AASM

  mount_uploader :client_logo, LogoUploader
  mount_uploader :image, ImageUploader

  validates :client_name, :client_logo, :project_title, :description, :image, presence: true
  validates :description, length: {maximum: 1000}

  aasm do
    state :draft, initial: true
    state :online

    event :go_online do
      transitions from: :draft, to: :online
    end

    event :go_offline do
      transitions from: :online, to: :draft
    end

  end

end
