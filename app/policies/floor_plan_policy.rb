class FloorPlanPolicy < ApplicationPolicy
  # floor plans are public
  def index?
    true
  end

  # floor plans are public
  def show?
    record.class.where(:id => record.id).exists?
  end

  # floor plans are public
  def download?
    show?
  end
end
