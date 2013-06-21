class History
  include Mongoid::Document
  include Mongoid::Timestamps
  referenced_in :user
  referenced_in :f
  
  validates :f, :presence => true
  validates :user, :presence => true

  field :note, :type => String
  field :quantity, "type => Integer

  scope :all_by_user, lambda { |user| { :where => { :user_id => user.id } } }

  def self.order_by_date 
    criteria.order_by(:created_at.desc)
  end

end
