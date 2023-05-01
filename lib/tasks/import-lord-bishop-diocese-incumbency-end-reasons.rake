require 'import/import'

# We include code from module.
include IMPORT

task :import_lord_bishop_diocese_incumbency_end_reasons => :environment do
  import_lord_bishop_diocese_incumbency_end_reasons
end