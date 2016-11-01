require 'csv'

class ImportJob < ApplicationJob
  queue_as :default

  def perform(list, import_file_path)
    contents = File.read(import_file_path)
    rows = CSV.parse(contents, headers: true)
    rows.each do |row|
      list.items.create(row.to_hash)
    end
  end
end
