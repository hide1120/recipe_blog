class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes, id: :string do |t|
      t.string :title
      t.string :description
      t.string :mainvisual
      t.string :serves

      t.timestamps
    end
  end
end
