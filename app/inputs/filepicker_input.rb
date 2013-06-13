class FilepickerInput < Formtastic::Inputs::StringInput
  def html_input_type
    'filepicker'
  end
  def to_html
    '<input type="filepicker" name="drink[filepicker_url]" />'
  end
end