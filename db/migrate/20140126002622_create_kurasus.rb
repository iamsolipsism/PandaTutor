class CreateKurasus < ActiveRecord::Migration
  def change
    create_table :kurasus do |t|
      t.string :department
      t.string :grade

      t.timestamps
    end
  end
end
