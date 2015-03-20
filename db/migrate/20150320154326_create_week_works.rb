class CreateWeekWorks < ActiveRecord::Migration
  def change
    create_table :week_works do |t|
      t.references :employee, index: true
      t.integer :week_number
      t.float :hours

      t.timestamps
    end
  end
end
