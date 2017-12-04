# frozen_string_literal: true

class StringInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options = nil)
    unless string?
      input_html_classes.unshift('string')
      input_html_options[:type] ||= input_type if html5?
    end

    merged_input_options = merge_wrapper_options(
      input_html_options, wrapper_options
    )
    textfield = @builder.text_field(attribute_name, merged_input_options)
    if merged_input_options[:maxlength].present?
      textfield << template.content_tag(:span, '', class: 'char_count')
    end
    textfield
  end
end
