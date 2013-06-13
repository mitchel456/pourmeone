ActiveAdmin.register Venue do
  controller do
    def permitted_params
      params.permit(:venue => [:source, :name, :address, :city, :state, :zip])
    end
  end
end
