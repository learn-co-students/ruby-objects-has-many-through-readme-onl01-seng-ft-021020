class Waiter
    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        self.save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper
        best_tip = 0
        best_tipped_meal = nil
        self.meals.each do |meal|
            if meal.tip > best_tip
                best_tip = meal.tip
                best_tipped_meal = meal
            end
        end
        best_tipped_meal.customer
    end
end