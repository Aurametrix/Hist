class ExtraInfo
  include Mongoid::Document
  
  field :first_name, :type => String
  field :first_variables, :type => Array
  
  field :second_name, :type => String
  field :second_variables, :type => Array
  
  embedded_in :f, :inverse_of => :extra_info

  def remove_blanks
    self.first_variables = self.first_variables.reject {|item| item.blank?} unless self.first_variables.nil?
    self.second_variables = self.second_variables.reject {|item| item.blank?} unless self.first_variables.nil?
  end
end
