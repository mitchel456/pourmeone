ActiveAdmin.register Drink do

  action_item do
    link_to "New Drink", new_admin_drink_path
  end

  form html: { enctype: 'multipart/form-data' } do |f|
    f.inputs 'Drink' do
      f.input :name
      f.input :venue
      f.input :approved, as: :boolean, input_html: { checked: 'checked' }
      f.has_many :drink_ingredients do |di|
        di.inputs 'Ingredients' do
          di.input :raw_text
          di.input :ingredient
          di.input :drink_id, :as => :hidden
        end
      end
      f.input :filepicker_url, as: 'filepicker'
      f.actions
    end
  end

  show do
    h3 drink.name
    img src: drink.filepicker_url
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
