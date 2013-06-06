Factory.define :valid_user , :class => User do |u|
  u.email "new@test.com"
  u.password "secretpassword"
end
