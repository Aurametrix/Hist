# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

sweating = F.create(:name => "fsweating", :type => "reaction", :action => Action.new(:name => "had", :measured_in => "units"))
patient = Patient.create(:email => "patient@hospital.com", :password => "secretpwd")
History.create(:patient => patient, :complaints => lotsof, :note => "gained weight too"))
