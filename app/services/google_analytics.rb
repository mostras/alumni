class GoogleAnalytics

  def initialize
  end

  def session_duration_calculation
    analytics = Google::Apis::AnalyticsreportingV4::AnalyticsReportingService.new

    credentials = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open('service_account_cred-data.json'),
      scope: 'https://www.googleapis.com/auth/analytics.readonly'
    )

    analytics.authorization = credentials # See: https://github.com/zquestz/omniauth-google-oauth2

    date_range = Google::Apis::AnalyticsreportingV4::DateRange.new(start_date: '7DaysAgo', end_date: 'today')
    metric = Google::Apis::AnalyticsreportingV4::Metric.new(expression: 'ga:avgSessionDuration')
    # dimension = Google::Apis::AnalyticsreportingV4::Dimension.new(name: 'ga:sessionDurationBucket')

    request = Google::Apis::AnalyticsreportingV4::GetReportsRequest.new(
      report_requests: [Google::Apis::AnalyticsreportingV4::ReportRequest.new(
        view_id: 'ga:232226299',
         metrics: [metric],
         # dimensions: [dimension],
         date_ranges: [date_range]
      )]
    ) # thanks to @9mm: https://github.com/google/google-api-ruby-client/issues/489

    response = analytics.batch_get_reports(request)
    report = response.reports
    session_duration = (report[0].data.rows[0].metrics[0].values[0]).to_i / 60

    return session_duration
  end

  def number_session_calculation
    analytics = Google::Apis::AnalyticsreportingV4::AnalyticsReportingService.new

    credentials = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open('service_account_cred-data.json'),
      scope: 'https://www.googleapis.com/auth/analytics.readonly'
    )

    analytics.authorization = credentials # See: https://github.com/zquestz/omniauth-google-oauth2

    date_range = Google::Apis::AnalyticsreportingV4::DateRange.new(start_date: '1DaysAgo', end_date: 'today')
    metric = Google::Apis::AnalyticsreportingV4::Metric.new(expression: 'ga:sessions')
    # dimension = Google::Apis::AnalyticsreportingV4::Dimension.new(name: 'ga:sessionDurationBucket')

    request = Google::Apis::AnalyticsreportingV4::GetReportsRequest.new(
      report_requests: [Google::Apis::AnalyticsreportingV4::ReportRequest.new(
        view_id: 'ga:232226299',
         metrics: [metric],
         # dimensions: [dimension],
         date_ranges: [date_range]
      )]
    ) # thanks to @9mm: https://github.com/google/google-api-ruby-client/issues/489

    response = analytics.batch_get_reports(request)
    report = response.reports
    number_session = (report[0].data.rows[0].metrics[0].values[0]).to_i

    return number_session
  end

end
