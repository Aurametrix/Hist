Factory.define :f, :class => F do |f|
  f.name "f"
  f.type "input"
  f.description "something"
  f.category nil
end

Factory.define :something, :class => F do |f|
  f.name "something"
  f.type "action"
  f.description "generic thing "
end

Factory.define :headache , :class => F do |f|
  f.name "headache"
  f.type "vague symptom"
  f.description "pain in the head"
  f.action { Factory.build(:happened_action) }
end
