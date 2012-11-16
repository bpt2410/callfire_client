# callfire-client - <www.callfire.com> service accessing library.
# Copyright (C) 2012  TP. Ho Chi Minh, Viet Nam  <phutuong24101990@gmail.com>.
# <callfire-client> provider functions send call to <www.callfire.com>
# See callfire-client for documentation.
module Callfire

  # Message successful.
  SUCCESSFUL = "successful"

  # Message fail
  FAIL = "fail"

  # Code fail when response service.
  CALL_RESPONSE_FAIL_CODE = 0

  # Code error when not enough parameters input.
  CALL_ERROR_PARAMS_CODE = 1

  # Code error when send call.
  CALL_FAIL_CODE = 2

  # Code catch exception when send call.
  EXCEPTION_CODE = 3

  # Code successful when send call.
  CALL_SUCCESSFUL_CODE = 4
  
end
