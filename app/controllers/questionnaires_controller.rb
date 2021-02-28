class QuestionnairesController < ApplicationController
  def index
    @questionnaires = Questionnaire.all.order(:id)
  end

  def new
    @questionnaire = Questionnaire.first

    @questionnaire_form = QuestionnairesForm.new(@questionnaire)

    @questionnaire_form.save!
  end

  private

  def questionnaire_params
    params.require(:questionnaire).permit(questionnaire_options_attributes: [:questionnaire_id])
  end
end
