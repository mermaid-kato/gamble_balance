class Questionnaire < ApplicationRecord
  has_many :questionnaire_options

  accepts_nested_attributes_for :questionnaire_options, allow_destroy: true
end
