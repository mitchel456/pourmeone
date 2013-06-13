ActiveAdmin.register Drink do

  form html: { enctype: 'multipart/form-data' } do |f|
    f.inputs 'Drink' do
      f.input :name
      f.input :venue
      f.input :approved
      f.has_many :drink_ingredients do |di|
        di.inputs 'Ingredients' do
          di.input :raw_text
          di.input :ingredient
        end
      end
      f.input :filepicker_url, as: 'filepicker'
      f.actions
    end


  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
