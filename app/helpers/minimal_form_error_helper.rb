# frozen_string_literal: true

module MinimalFormErrorHelper
  def minimal_form_errors(object, field_name)
    return if object.errors[field_name.to_sym].empty?

    content_tag(:span, class: 'error-message') do
      concat icon(:exclamation, class: 'd-inline')
      concat ' '
      concat object.errors[field_name].join(', ')
    end
  end
end
