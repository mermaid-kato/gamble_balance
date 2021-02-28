class QuestionnairesForm
  include ActiveModel::Model

  attr_accessor :questionnaire

  def initialize(questionnaire)
    @questionnaire = questionnaire
  end

  def save!
    set_questionnaire_options

    questionnaire.save
  end

  private

  def set_questionnaire_options
    questionnaire_options = questionnaire.questionnaire_options
    questionnaire_options.find_or_initialize_by(title: "ららら")

    questionnaire_options.map do |q|

      if q.title == "ららら"
        q.title = "まま"
      else
        q.mark_for_destruction
      end

      q
    end
  end

  def set_members
    member_ids = r.members.ids

    q.members.map do |m|

      if member_ids.include?(member_ids)
        r_member = r.members.find_by(member_id: m.member_id)

        m.attributes = {
          title: "aa",
          bb: "aaa"
        }
      else
        r.mark_for_destruction
      end

      m
    end
  end

end
