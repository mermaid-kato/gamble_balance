class QuestionnairesForm
  include ActiveModel::Model
  
  attr_accessor :model
  
  def initialize(model)
    @model = model
  end
end
