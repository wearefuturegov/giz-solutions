# frozen_string_literal: true

class TextInput < SimpleForm::Inputs::TextInput
  def input(wrapper_options = nil)
    merged_input_options = merge_wrapper_options(
      input_html_options, wrapper_options
    )
    textarea = @builder.text_area(attribute_name, merged_input_options)
    if merged_input_options[:maxlength].present?
      textarea << template.content_tag(:span, '', class: 'char_count')
    end
    textarea
  end
end
