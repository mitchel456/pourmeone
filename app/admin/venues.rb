ActiveAdmin.register Venue do

  index do
    column :name
    column :address
    column :city
    column :state
    column :zip
    column "Drinks Served" do |venue|
      venue.drinks.count
    end
    actions
  end

  form do |f|
    f.inputs 'Venue' do
      f.input :name
      f.input :address
      f.input :city
      f.input :state
      f.input :zip
      f.input :yelp_id
      f.actions
    end
  end

  controller do
    def permitted_params
      params.permit(:venue => [:name, :address, :city, :state, :zip, :yelp_id])
    end
  end
end
