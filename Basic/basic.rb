authenticate_or_request_with_http_basic do |username, password|
  username == 'test' && password == 'password'
end
