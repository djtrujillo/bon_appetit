class Pantry
  attr_reader :stock,
              :cookbook
  def initialize
    @stock = {}
    @cookbook = []
  end

  def stock_check(item)
    if @stock[item] == nil
      @stock[item] = 0
    end
    @stock[item]
  end

  def restock(item, amount)
    if @stock[item] == nil
      @stock[item] = amount
    else
      @stock[item] = @stock[item] + amount
    end
  end


  def convert_units(recipe)
    ingredients = recipe.ingredients
    ingredients.map do |ingredient, amount|
      if amount < 1
        ingredients[ingredient] = {:quantity => mili_units(amount), :units => "Milli-Units"}
      elsif amount < 100
        ingredients[ingredient] = {:quantity => amount, :units => "Universal Units"}
      else
        ingredients[ingredient] = {:quantity => centi_units(amount), :units => "Centi_Units"}
      end
    end
    ingredients
  end

  def centi_units(universal_units)
    universal_units/100
  end

  def mili_units(universal_units)
    (universal_units * 1000).to_i
  end

  def add_to_cookbook(recipe)
    @cookbook << recipe
  end

  def what_can_i_make
    what_can_i_make = []
    @cookbook.each do |recipe|
      if stock_check_ingredients(recipe.ingredients) == true
        what_can_i_make << recipe.name
      end
    end
    what_can_i_make
  end

  def stock_check_ingredients(ingredients)
    ingredients.each do |ingredient, amount|
      if stock_check(ingredient) < amount
        return false
      end
    end
    true
  end

  def difference_in_ingredients(ingredient)
    

  end


  def find_recipe_by_name(name)
    @cookbook.find do |recipe|
      recipe.name == name
    end
  end

  def how_many_can_i_make




  end

end


# recipe_names = what_can_i_make
# recipes = recipe_names.map do |name|
#   find_recipe_by_name(name)
# end
#
# recipe_units = recipes.map do |recipe|
#   convert_units(recipe)
# end
#
# recipe_units.each do |recipe_ingredients|
#
#   recipe_ingredient.each do |ingredient|
#     ingredient[]
#   # = recipe_units[ingredient][:quantity] / stock_check(ingredient)
