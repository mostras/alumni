class AddMail

  def initialize(id, linkedin_url)
    @id = id
    @linkedin_url = linkedin_url
  end

  def google_sheet
    add_cell(@linkedin_url, @id)
  end

  private

  OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
  APPLICATION_NAME = "Google Sheets API Ruby Quickstart".freeze
  CREDENTIALS_PATH = "credentials.json".freeze
  TOKEN_PATH = "token.yaml".freeze
  SCOPE = Google::Apis::SheetsV4::AUTH_DRIVE

  def authorize
    client_id = Google::Auth::ClientId.from_file CREDENTIALS_PATH
    token_store = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
    authorizer = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store
    user_id = "default"
    credentials = authorizer.get_credentials user_id
    if credentials.nil?
      url = authorizer.get_authorization_url base_url: OOB_URI
      puts "Open the following URL in the browser and enter the " \
           "resulting code after authorization:\n" + url
      code = gets
      credentials = authorizer.get_and_store_credentials_from_code(
        user_id: user_id, code: code, base_url: OOB_URI
      )
    end
    credentials
  end

  def add_cell(url, cell)

    # Initialize the API
    service = Google::Apis::SheetsV4::SheetsService.new
    service.client_options.application_name = APPLICATION_NAME
    service.authorization = authorize

    spreadsheet_id = "1GHd1G2tn72_dUgblog07y65dXQdsfbz5M3s09tH82HM"
    range_name = "Feuille 1!A#{cell}"
    value_input_option = 'USER_ENTERED'

    values = [
      [
        url
      ]
      # Additional rows ...
    ]

    value_range_object = Google::Apis::SheetsV4::ValueRange.new(range:  range_name,
                                                                values: values)
    result = service.update_spreadsheet_value(spreadsheet_id,
                                              range_name,
                                              value_range_object,
                                              value_input_option: value_input_option)

  end
end
