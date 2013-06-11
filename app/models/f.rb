class F
  include Mongoid::Document
  field :name, :type => String
  field :type, :type => String
  field :description, :type => String
  field :category, :type => String

  embeds_many :ints

  accepts_nested_attributes_for :ints, :allow_destroy => true
    :reject_if => proc { |attrs| (attrs['_destroy'] == '1' and attrs['id'].blank?) or attrs['f_id'].blank?}
  validates :name, :presence => true, :uniqueness => true
  validates_associated :ingredients
  
  scope :name_starts_with, lambda { |name| where(:name => /^#{name}/i).order_by(:name.asc) }

  def available_categories
    F.all.order_by(:name.asc).reject {|f| f.name == self.name}
  end

  def self.all
    order_by(:name.asc)
  end

end
