# frozen_string_literal: true

class Solution < ApplicationRecord
  belongs_to :user

  validates :user, :title, :description, :business_opportunities,
            :implementation_impact, :skills_experience, presence: true
end
