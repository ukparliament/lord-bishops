# We requite csv code.
require 'csv'

# # A module for importing from tab separated files.
module IMPORT
  
  # ## A method to import people.
  def import_people
    puts "Importing people"

    # For each row in the people data file ...
    CSV.foreach( 'db/data/people.tsv', :col_sep => "\t" ) do |row|
      
      # ... we create a new person record.
      person = Person.new
      person.forenames = row[0]
      person.surname = row[1]
      person.year_of_birth = row[2]
      person.month_of_birth = row[3]
      person.day_of_birth = row[4]
      person.year_of_death = row[5]
      person.month_of_death = row[6]
      person.day_of_death = row[7]
      person.is_advanced_under_lords_spiritual_women_act_2015 = row[8]
      person.wikidata_id = row[9]
      person.mnis_id = row[10]
      person.note = row[11]
      person.link_on = row[12]
      person.save
    end
  end
end