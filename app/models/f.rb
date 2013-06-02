class F
  include Mongoid::Document
  field :name, :type => String
  field :type, :type => String
  field :description, :type => String
  field :category, :type => String

  validates :name, :presence => true, :uniqueness => true
  
  scope :name_starts_with, lambda { |name| where(:name => /^#{name}/i).order_by(:name.desc) }

end
