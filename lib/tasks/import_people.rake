require 'import/import'

# We include code from module.
include IMPORT

task :import_people => :environment do
  import_people
end