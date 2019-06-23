require 'csv'

CSV.generate do |csv|
  column_names = %w(name age Email gender)
  csv << column_names
  @users.pluck(*column_names).each do |row|
    csv << row
  end
end
