require 'import/import'

# We include code from module.
include IMPORT

task :import_translations => :environment do
  import_translations
end