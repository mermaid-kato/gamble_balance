class QuestionnairesController < ApplicationController
  def index
    @questionnaires = Questionnaire.all.order(:id)
  end
end
