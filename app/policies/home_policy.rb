class HomePolicy < ApplicationPolicy

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    true
  end
end