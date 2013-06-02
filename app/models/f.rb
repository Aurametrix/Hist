class F
  include Mongoid::Document
  field :name, :type => String
  field :type, :type => String
  field :description, :type => String

  scope :name_starts_with, lambda { |name| where(:name => /^#{name}/i) }

end
