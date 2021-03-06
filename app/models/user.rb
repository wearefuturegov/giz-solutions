# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :confirmable, :recoverable, :rememberable, :trackable,
         :validatable

  has_one :solution

  validates :first_name, :last_name, presence: true

  scope :admins, -> { where(admin: true) }

  def name
    "#{first_name} #{last_name}"
  end
end
