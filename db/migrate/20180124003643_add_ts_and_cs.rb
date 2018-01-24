# frozen_string_literal: true

class AddTsAndCs < ActiveRecord::Migration[5.1]
  def change
    add_column :solutions, :terms_accepted, :boolean, default: false
  end
end
