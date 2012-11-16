# callfire-client - <www.callfire.com> service accessing library.
# Copyright (C) 2012  TP. Ho Chi Minh, Viet Nam  <<phutuong24101990@gmail.com>>.
# 'callfire-client' provider functions send call to <www.callfire.com>.
# See callfire-client for documentation.
module Callfire
  class Response
    attr_accessor :code, :message

    # initialize Response
    def initialize(code, message, options = {})
      @code, @message = code, message
      @options = options
    end

    # return json format
    def to_json
      {"code" => @code, "message" => @message, "results" => @options}
    end

  end
 
end