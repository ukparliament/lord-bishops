require 'import/import'

# We include code from module.
include IMPORT

task :import_established_churches => :environment do
  import_established_churches
end