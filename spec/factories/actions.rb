Factory.define :happened_action, :class => Action, :default_strategy => :build do |a|
  a.name "happened"
  a.measured_in "quantities"
end
