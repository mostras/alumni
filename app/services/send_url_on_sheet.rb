class SendUrlOnSheet

  def initialize(url, sheet, cell)
    @url = url
    @sheet = sheet
    @cell = cell
  end

  def send_to_google_sheet
    session = GoogleDrive::Session.from_service_account_key("client-secret.json")
    spreadsheet = session.spreadsheet_by_title("url_linkedin_app_alumni")
    worksheet = spreadsheet.worksheets[@sheet]
    worksheet.insert_rows(@cell,
      [
        [@url]
      ])

    worksheet.save
  end
end
