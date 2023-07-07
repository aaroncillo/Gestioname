class CsvImportService
  require 'csv'

  def initialize(file, company_id, current_user)
    @file = file
    @count = 0
    @company_id = company_id
    @current_user = current_user
  end

  def import
    @count = 0

    if @file.content_type == 'text/csv'
      import_csv
    elsif @file.content_type == 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
      import_xlsx
    else
      raise ArgumentError, 'Invalid file format'
    end
  end

  def number_imported_with_last_run
    @count
  end

  private

  def import_csv
    CSV.foreach(@file.path, headers: true) do |row|
      income_params = {
        item_name: row['item_name'],
        description: row['description'],
        amount: row['amount'],
        date: row['date'],
        company_id: @company_id
      }
      Income.create!(income_params)
      @count += 1
    end
  end

  def import_xlsx
    spreadsheet = Roo::Spreadsheet.open(@file.path)

    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      income_params = {
        item_name: row['item_name'],
        description: row['description'],
        amount: row['amount'],
        date: row['date'],
        company_id: @company_id
      }
      Income.create!(income_params)
      @count += 1
    end
  end
end
