# frozen_string_literal: true

class ApplicationState < ApplicationRecord
  enum state: %i[collection judging announce_winners]

  def self.instance
    first || ApplicationState.create
  end
end
