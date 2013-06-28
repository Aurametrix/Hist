class ExtraInfo
  include Mongoid::Document
  
  field :first_name, :type => String
  field :first_variables, :type => Array
  
  field :second_name, :type => String
  field :second_variables, :type => Array
  
  embedded_in :f, :inverse_of => :extra_info
end
