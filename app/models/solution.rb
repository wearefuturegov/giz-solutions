# frozen_string_literal: true

class Solution < ApplicationRecord
  acts_as_paranoid
  belongs_to :user

  validates :user, :hero_image, :title, :description, :business_opportunities,
            :implementation_impact, :skills_experience, presence: true

  validates :terms_accepted, inclusion: {
    in: [true], message: 'Terms must be accepted'
  }

  has_attached_file :hero_image,
                    styles: { medium: '300x300>', thumb: '50x50>' },
                    default_url: ''

  validates_attachment_content_type :hero_image, content_type: %r{\Aimage\/.*\z}

  validates :hero_image, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :hero_image
  validates_with AttachmentSizeValidator, attributes: :hero_image, less_than: 5.megabytes

  scope :winners, -> { where(winner: true) }
end
