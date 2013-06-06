class History
  include Mongoid::Document
  include Mongoid::Timestamps
  referenced_in :user
  referenced_in :f
  
  validates :f, :presence => true
  validates :user, :presence => true

  field :note, :type => String

  scope :all_by_user, lambda { |user| { :where => { :user_id => user.id } } }
end
