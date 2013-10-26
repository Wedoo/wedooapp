class CreateAdwordAuths < ActiveRecord::Migration
  def change
    create_table :adword_auths do |t|
      t.references :initiative, index: true
      t.string :access_token
      t.string :refresh_token
      t.datetime :issued_at
      t.integer :expires_in

      t.timestamps
    end
  end
end
