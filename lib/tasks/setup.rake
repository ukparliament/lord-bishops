task :setup => [
  :import_people,
  :import_established_churches,
  :import_lord_bishop_dioceses,
  :import_lord_bishop_diocese_incumbency_end_reasons,
  :import_lord_bishop_diocese_incumbencies,
  :import_translations] do
end