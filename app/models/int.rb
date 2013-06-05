class Ingredient
  include Mongoid::Document
  referenced_in :food
  embedded_in :food, :inverse_of => :ingredients
  validates_presence_of :food_id
  
  def name
    f = Food.criteria.id(self.food_id).first
    f.name
  end
end
