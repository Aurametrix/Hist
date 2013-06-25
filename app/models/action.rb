class Action
  include Mongoid::Document
  field :name, :type => String
  field :measured_in, :type => String
  
  embedded_in :f, :inverse_of => :action
end
