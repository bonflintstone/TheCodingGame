desc "Import from config.json"
task import: :environment do
  Importer.new('config.json').load
end
