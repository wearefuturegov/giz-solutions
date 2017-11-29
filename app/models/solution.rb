# frozen_string_literal: true

class Solution < ApplicationRecord
  belongs_to :user

  validates :title, :description, :business_opportunities,
            :implementation_impact, presence: true
end
