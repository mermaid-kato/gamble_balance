class QuestionnairesController < ApplicationController
  def index
    @questionnaires = Questionnaire.all.order(:id)
  end
  
  def new
    @questionnaire = Questionnaire.first
    # @questionnaire.questionnaire_options.build
    
    @questionnaire_form = QuestionnairesForm.new(@questionnaire)
  end
  
  private
  
  def questionnaire_params
    params.require(:questionnaire).permit(questionnaire_options_attributes: [:questionnaire_id])
  end
end


module Cocoon
  module ViewHelpers
    def link_to_add_association(*args, &block)
      if block_given?
        link_to_add_association(capture(&block), *args)
      elsif args.first.respond_to?(:object)
        association = args.second
        name = I18n.translate("cocoon.#{association}.add", default: I18n.translate('cocoon.defaults.add'))

        link_to_add_association(name, *args)
      else
        name, f, association, html_options = *args
        html_options ||= {}

        render_options   = html_options.delete(:render_options)
        render_options ||= {}
        override_partial = html_options.delete(:partial)
        wrap_object = html_options.delete(:wrap_object)
        force_non_association_create = html_options.delete(:force_non_association_create) || false
        form_parameter_name = html_options.delete(:form_name) || 'f'
        count = html_options.delete(:count).to_i

        html_options[:class] = [html_options[:class], "add_fields"].compact.join(' ')
        html_options[:'data-association'] = association.to_s.singularize
        html_options[:'data-associations'] = association.to_s.pluralize

        new_object = create_object(f, association, force_non_association_create)
        new_object = wrap_object.call(new_object) if wrap_object.respond_to?(:call)

        html_options[:'data-association-insertion-template'] = CGI.escapeHTML(render_association(association, f, new_object, form_parameter_name, render_options, override_partial).to_str).html_safe

        html_options[:'data-count'] = count if count > 0
        
        link_to(name, '#', html_options)
      end
    end

    def create_object(f, association, force_non_association_create=false)
      assoc = f.object.model.class.reflect_on_association(association)
      binding.pry
      
      assoc ? create_object_on_association(f, association, assoc, force_non_association_create) : create_object_on_non_association(f, association)
    end

  end
end
