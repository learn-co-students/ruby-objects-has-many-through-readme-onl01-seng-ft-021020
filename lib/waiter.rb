class Waiter

  @@all = []

  def initialize(name, exp)
    @name = name
    @experience = exp
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal if meal.waiter == self }
  end

  def best_tipper
    best_tip_meal = meals.max{ |a, b| a.tip <=> b.tip }
    best_tip_meal.customer
  end

end