class History
  include Mongoid::Document
  include Mongoid::Timestamps
  references_in :user
  
  field :note, :type => String

  scope :all_by_user, lambda { |user| { :where => { :user_id => user.id } } }
end
