class History
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :note, :type => String
end
