require 'import/import'

# We include code from module.
include IMPORT

task :import_lord_bishop_dioceses => :environment do
  import_lord_bishop_dioceses
end