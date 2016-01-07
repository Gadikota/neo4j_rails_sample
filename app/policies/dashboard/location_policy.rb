module Dashboard
  class HomePolicy < DashboardPolicy
    def initialize(user, record)
      @user = user
      @record = record
    end

    def show?
      @user.present?
    end
  end
end