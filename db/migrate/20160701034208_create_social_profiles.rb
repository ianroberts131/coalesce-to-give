class CreateSocialProfiles < ActiveRecord::Migration
  def change
    create_table :social_profiles do |t|
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :linked_in
      
      t.references :sociable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
