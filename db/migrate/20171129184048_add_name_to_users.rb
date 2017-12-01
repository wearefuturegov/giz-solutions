# frozen_string_literal: true

class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :organisation, :string
    rename_column :solutions, :video_url, :embedded_video_url
  end
end
