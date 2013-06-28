class F
  include Mongoid::Document
  field :name, :type => String
  field :type, :type => String
  field :description, :type => String

  embeds_many :ints
  embeds_one :action
  embeds_one :extra_info, :class_name => "ExtraInfo"

  references_many :children, :class_name => "F", :foreign_key => "parent_id"
  referenced_in :parent, :class_name => "F"
  
  
  accepts_nested_attributes_for :ints, :allow_destroy => true
    :reject_if => proc { |attrs| (attrs['_destroy'] == '1' and attrs['id'].blank?) or attrs['f_id'].blank?}
  validates :name, :presence => true, :uniqueness => true
  validates_associated :ingredients
  
  scope :name_starts_with, lambda { |name| where(:name => /^#{name}/i).order_by(:name.asc) }

  before_save :remove_empty_action, :remove_blank_extra_info
  before_update :remove_empty_action, :remove_blank_extra_info
  before_destroy :destroy_children

  def available_categories
    F.all_by_name.reject {|f| f.name == self.name}
  end

  alias_method :basic_action, :action
  
  def top_level_action
    if self.action.nil? or self.action.name.blank?
      self.parent.top_level_action unless self.parent.blank?
    else
      self.action
    end
  end

  def category
    self.parent.name unless parent.nil?
  end
  
  class << self
    def all_by_name
      ascending(:name)
    end
  end
  

  private
    def destroy_children
      self.children.destroy_all
    end

    
    def remove_blank_extra_info
      unless self.extra_info.nil?
        self.extra_info.remove_blanks
      end
    end

    def remove_empty_action
      unless self.action.nil?
        if self.action.name.blank?
          self.action = nil
        end
      end
      
    end


end
