# frozen_string_literal: true

class Solution < ApplicationRecord
  belongs_to :user

  validates :user, :hero_image, :title, :description, :business_opportunities,
            :implementation_impact, :skills_experience, presence: true

  has_attached_file :hero_image,
                    styles: { medium: '300x300>', thumb: '50x50>' },
                    default_url: ''

  validates_attachment_content_type :hero_image, content_type: %r{\Aimage\/.*\z}
end
