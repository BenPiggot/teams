class CreateTagsTeams < ActiveRecord::Migration
  def change
    create_table :tags_teams do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
