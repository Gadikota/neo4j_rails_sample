module Dashboard
  class HomeController < DashboardController
    # "Mohan::#{self.class.name}".deconstantize.underscore
    # output -> mohan/dashboard
    def show
      authorize :"#{params[:controller]}", :show?
    end
  end
end