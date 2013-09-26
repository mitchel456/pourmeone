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

  controller do
    def permitted_params
      params.permit(:venue => [:source, :name, :address, :city, :state, :zip])
    end
  end
end
