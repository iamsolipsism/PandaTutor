class AddUniversityIdentifierToUser < ActiveRecord::Migration
  def change
    add_column :users, :universityIdentifier, :string
  end
end
