class History
  include Mongoid::Document
  include Mongoid::Timestamps
  referenced_in :user
  referenced_in :f
  
  validates :f, :presence => true
  validates :user, :presence => true
  validates :quantities, :numericality => true

  field :note, :type => String
  field :quantity, "type => Float, :default => 1.0
  field :happened_at, "type => DateTime
  field :alias, :type => String

  scope :all_by_user, lambda { |user| { :where => { :user_id => user.id } } }

  before_create :generate_happened_at

  def self.order_by_happened_at
    criteria.order_by(:created_at.desc)
  end

  def subhistory
    self.f.subhistories.find(self.subhistory_id) unless self.f.nil? or self.subhistory_id.blank?
  end
  
  def title
    name = self.alias.blank? ? self.f.name : self.alias
    
    if self.variety.nil?
      name
    else
      "#{name}, #{self.subhistory.name}"
    end
  end


  private
     def generate_happened_at
       self.happened_at = Time.now if self.happened_at.nil?
     end

end
