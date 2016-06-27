class CreateNonprofits < ActiveRecord::Migration
  def change
    create_table :nonprofits do |t|
      t.string :name
      t.string :website
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
