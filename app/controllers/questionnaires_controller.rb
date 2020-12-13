class QuestionnairesController < ApplicationController
  def index
    @questionnaires = Questionnaire.all.order(:id)
  end
  
  def new
    @questionnaire = Questionnaire.new
    @questionnaire.questionnaire_options.build
  end
  
  private
  
  def questionnaire_params
    params.require(:questionnaire).permit(questionnaire_options_attributes: [:questionnaire_id])
  end
end
