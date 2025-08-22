class CreateHistograms < ActiveRecord::Migration[8.0]
  def change
    create_table :histograms do |t|
      t.text :corpus

      t.timestamps
    end
  end
end
