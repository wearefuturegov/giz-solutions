class AddLicensingAcceptedToSolutions < ActiveRecord::Migration[5.1]
  def change
    add_column :solutions, :licensing_accepted, :boolean, default: false
  end
end
