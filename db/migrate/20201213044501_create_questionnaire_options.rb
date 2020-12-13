class CreateQuestionnaireOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaire_options do |t|
      t.string :title
      t.boolean :enabled, default: false
      t.references :questionnaire, null: false
    end
  end
end
