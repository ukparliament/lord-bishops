require 'import/import'

# We include code from module.
include IMPORT

task :import_lord_bishop_diocese_incumbencies => :environment do
  import_lord_bishop_diocese_incumbencies
end