class CreateSlides < ActiveRecord::Migration[5.0]
  def change
    create_table :slides do |t|
      t.string :client_name
      t.string :client_logo
      t.string :project_title
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
