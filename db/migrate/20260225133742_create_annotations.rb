class CreateAnnotations < ActiveRecord::Migration[8.1]
  def change
    create_table :annotations do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
