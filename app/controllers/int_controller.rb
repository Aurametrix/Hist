class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
    
    respond_to do |format|
      format.html
      format.js
    end
  end

end
