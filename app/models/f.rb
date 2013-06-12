class F
  include Mongoid::Document
  field :name, :type => String
  field :type, :type => String
  field :description, :type => String
  field :category, :type => String
  field :action, :type => String

  embeds_many :ints

  references_many :children, :class_name => "F", :foreign_key => "parent_id"
  referenced_in :parent, :class_name => "F"
  
  before_save :update_category
  
  accepts_nested_attributes_for :ints, :allow_destroy => true
    :reject_if => proc { |attrs| (attrs['_destroy'] == '1' and attrs['id'].blank?) or attrs['f_id'].blank?}
  validates :name, :presence => true, :uniqueness => true
  validates_associated :ingredients
  
  scope :name_starts_with, lambda { |name| where(:name => /^#{name}/i).order_by(:name.asc) }

  def available_categories
    F.all_by_name.reject {|f| f.name == self.name}
  end

  alias_method :basic_action, :action
  
  def action
    if self.basic_action.nil?
      self.parent.action unless self.parent.nil?
    else
      self.basic_action
    end
  end
  
  class << self
    def all_by_name
      ascending(:name)
    end
  end
  
  def update_category
    self.category = self.parent.name unless parent.nil?
  end

end
