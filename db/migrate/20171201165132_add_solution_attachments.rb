# frozen_string_literal: true

class AddSolutionAttachments < ActiveRecord::Migration[5.1]
  def self.up
    add_attachment :solutions, :hero_image
  end

  def self.down
    remove_attachment :solutions, :hero_image
  end
end
