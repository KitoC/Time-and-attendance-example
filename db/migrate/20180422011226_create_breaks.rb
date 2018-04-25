class CreateBreaks < ActiveRecord::Migration[5.1]
  def change
    create_table :breaks do |t|
      t.datetime :clockout
      t.datetime :clockin
      t.references :shift, foreign_key: true

      t.timestamps
    end
  end
end
