class Recipe < ActiveRecord::Base
  has_many :ingredients

  attr_reader :quantities

  def quantities=(quantities)

  end

  def ingredient_names=(names)
    names.delete_if do |ingredient|
      ingredient[:name].empty?
    end.each do |ingredient|
      new_ingredient = Ingredient.find_or_create_by(name: ingredient[:name])
      new_ingredient.quantity = ingredient[:quantity]
      self.ingredients << new_ingredient
    end
  end

  def ingredient_names

  end
end
