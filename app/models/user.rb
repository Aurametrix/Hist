class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  embeds_many :roles

  references_many :histories


  def has_roles?(role_str)
    self.roles.collect{|r| r.name}.include?(role_str)
  end
  
  def admin?
    has_roles?("admin")
  end


end
