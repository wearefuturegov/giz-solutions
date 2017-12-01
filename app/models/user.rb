# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :confirmable, :recoverable, :rememberable, :trackable,
         :validatable

  has_one :solution, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end

end
