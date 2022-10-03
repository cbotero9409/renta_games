class GamePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all.order(created_at: :desc)
    end
  end

  def create?
    user.role == "provider"
  end

  def show?
    true
  end

  def update?
    record.user == user
  end
end
