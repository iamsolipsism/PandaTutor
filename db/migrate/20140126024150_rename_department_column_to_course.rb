class RenameDepartmentColumnToCourse < ActiveRecord::Migration
  def self.up
    rename_column :kurasus, :department, :course
  end

  def self.down
    rename_column :kurasus, :course, :department
  end
end
