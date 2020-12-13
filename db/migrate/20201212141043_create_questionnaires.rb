class CreateQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaires do |t|
      t.string :title
      t.boolean :enabled, default: false
    end
  end
end
