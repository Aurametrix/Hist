class Int
  include Mongoid::Document
  referenced_in :f
  embedded_in :f, :inverse_of => :ints
  validates_presence_of :f_id
  
  field :quantity, :type => Float, :default => 1.0
  validates_presence_of :f_id

  def name
    f = F.criteria.id(self.f_id).first
    f.name
  end
end
