require "google/apis/sheets_v4"
require "googleauth"
require "googleauth/stores/file_token_store"
require "fileutils"

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
    linkedin_url = params["user"]["linkedin_url"]
    cell = @user.id
    linkedin(linkedin_url, cell)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
  APPLICATION_NAME = "Google Sheets API Ruby Quickstart".freeze
  CREDENTIALS_PATH = "credentials.json".freeze
  # The file token.yaml stores the user's access and refresh tokens, and is
  # created automatically when the authorization flow completes for the first
  # time.
  TOKEN_PATH = "token.yaml".freeze
  SCOPE = Google::Apis::SheetsV4::AUTH_DRIVE

  ##
  # Ensure valid credentials, either by restoring from the saved credentials
  # files or intitiating an OAuth2 authorization. If authorization is required,
  # the user's default browser will be launched to approve the request.
  #
  # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
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


  def linkedin(url, cell)

    # Initialize the API
    service = Google::Apis::SheetsV4::SheetsService.new
    service.client_options.application_name = APPLICATION_NAME
    service.authorization = authorize

    # Prints the names and majors of students in a sample spreadsheet:
    # https://docs.google.com/spreadsheets/d/1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms/edit
    spreadsheet_id = "1GHd1G2tn72_dUgblog07y65dXQdsfbz5M3s09tH82HM"
    range = "Feuille 1!A2:E"
    response = service.get_spreadsheet_values spreadsheet_id, range
    puts "Name, Major:"
    puts "No data found." if response.values.empty?
    response.values.each do |row|
      # Print columns A and E, which correspond to indices 0 and 4.
      puts "#{row[0]}, #{row[4]}"
    end

    #Update one cell
      spreadsheet_id = "1GHd1G2tn72_dUgblog07y65dXQdsfbz5M3s09tH82HM"
      range_name = "Feuille 1!A#{cell}"
      value_input_option = 'USER_ENTERED'

      values = [
        [
          url
        ]
        # Additional rows ...
      ]
      data = [
        {
          range:  range_name,
          values: values
        },
        # Additional ranges to update ...
      ]
      value_range_object = Google::Apis::SheetsV4::ValueRange.new(range:  range_name,
                                                                  values: values)
      result = service.update_spreadsheet_value(spreadsheet_id,
                                                range_name,
                                                value_range_object,
                                                value_input_option: value_input_option)

      puts "#{result.updated_cells} cells updated."

  end

end
