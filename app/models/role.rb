class Role
  include Mongoid::Document  
  field :name
  
  embedded_in :user, :inverse_of => :roles
end
