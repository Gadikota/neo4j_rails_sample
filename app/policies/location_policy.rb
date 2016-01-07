class LocationPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      Location.all
    end
  end

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    @user.present?
  end

  def index?
    true
  end

  def import?
    @user.present?
  end

  def create?
    @user.present?
  end

  def permitted_attributes
    [:csv]
  end

end