class EventPolicy < ApplicationPolicy
  def index?
    user_present?
  end

  def show?
    user_present?
  end

  def new?
    user_present?
  end

  def create?
    new?
  end

  def edit?
    user_owner?
  end

  def update?
    edit?
  end

  def destroy?
    user_owner?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

  private
  def user_present?
    user.present?
  end

  def user_owner?
    record.user == user
  end
end
