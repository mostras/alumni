task :parsing_data => :environment do
  ParsingDataJob.perform_later
end
