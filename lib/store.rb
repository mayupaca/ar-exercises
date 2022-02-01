class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: {minimum: 3}
  validates :annual_revenue, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  validate :either_apparel

  def either_apparel
    if !womens_apparel && !mens_apparel
      errors.add(:mens_apparel, "either mens or womens apparel must be true")
    end
  end
end
