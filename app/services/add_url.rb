class AddUrl

  def initialize(id, linkedin_url)
    @id = id
    @linkedin_url = linkedin_url
  end

  def google_sheet
    add_cell(@linkedin_url, @id)
  end

  private

  def add_cell(url, cell)


  session = GoogleDrive::Session.from_service_account_key("client-secret.json")
  spreadsheet = session.spreadsheet_by_title("url_linkedin_app_alumni")
  worksheet = spreadsheet.worksheets.first
  worksheet.insert_rows(cell,
    [
      [url]
    ])

  worksheet.save

end


end
