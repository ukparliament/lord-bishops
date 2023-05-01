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
  
  # ## A method to import established churches.
  def import_established_churches
    puts "Importing established churches"

    # For each row in the established churches data file ...
    CSV.foreach( 'db/data/established-churches.tsv', :col_sep => "\t" ) do |row|
      
      # ... we create a new established church.
      established_church = EstablishedChurch.new
      established_church.name = row[0]
      established_church.disestablished_on = row[1]
      established_church.wikidata_id = row[2]
      established_church.note = row[3]
      established_church.save
    end
  end
  
  # ## A method to import lord bishop dioceses.
  def import_lord_bishop_dioceses
    puts "Importing lord bishop dioceses"

    # For each row in the lord bishop dioceses data file ...
    CSV.foreach( 'db/data/lord-bishop-dioceses.tsv', :col_sep => "\t" ) do |row|
      
      # ... we find the accociated established church ...
      established_church = EstablishedChurch.find_by_name( row[11] )
      
      # ... and create a new person record.
      lord_bishop_diocese = LordBishopDiocese.new
      lord_bishop_diocese.most_recent_name = row[0]
      lord_bishop_diocese.start_year = row[1]
      lord_bishop_diocese.start_month = row[2]
      lord_bishop_diocese.start_day = row[3]
      lord_bishop_diocese.end_year = row[4]
      lord_bishop_diocese.end_month = row[5]
      lord_bishop_diocese.end_day = row[6]
      lord_bishop_diocese.gazette_url = row[7]
      lord_bishop_diocese.is_named_see = row[8]
      lord_bishop_diocese.is_archdiocese = row[9]
      lord_bishop_diocese.wikidata_id = row[10]
      lord_bishop_diocese.established_church = established_church
      lord_bishop_diocese.link_on = row[12]
      lord_bishop_diocese.note = row[13]
      lord_bishop_diocese.save
    end
  end
end