class CreateShiftweeks < ActiveRecord::Migration[5.1]
  def change
    create_table :shiftweeks do |t|
      t.string :week_ending
      
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
