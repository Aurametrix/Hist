class Ingredient
  include Mongoid::Document
  field :name,  :type => String
  embedded_in :f, :inverse_of => :ints
end
