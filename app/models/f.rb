class F
  include Mongoid::Document
  field :name, :type => String
  field :type, :type => String
  field :description, :type => String
  field :category, :type => String

  embeds_many :ints

  accepts_nested_attributes_for :ints, :allow_destroy => true

  validates :name, :presence => true, :uniqueness => true
  
  scope :name_starts_with, lambda { |name| where(:name => /^#{name}/i).order_by(:name.asc) }

  def available_categories
    F.all.order_by(:name.asc).reject {|f| f.name == self.name}
  end
end
