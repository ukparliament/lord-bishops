require 'import/import'

# We include code from module.
include IMPORT

task :import_seniorities => :environment do
  import_seniorities
end