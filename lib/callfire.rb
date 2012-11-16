require 'net/http'
require 'json'
require 'uri'
require 'cgi'
require 'active_support/core_ext/hash'
load "exception_callfire.rb"
load "utils/constants.rb"
load "version.rb"

module Callfire
  class Client
    attr_accessor :api_key, :http, :headers

    # initialize for Client.
    def initialize(api_key, options = {})
      @api_key = api_key

      @headers = {"Content-Type" => "application/x-www-form-urlencoded"}

      @json = options.fetch(:json) { JSON }
      
      @http = Net::HTTP.new('www.callfire.com', 443)

      @http.use_ssl = true
    end

    # This method send call to <www.callfire.com> service.
    def send_call(campaign_id = nil, numbers = nil)
      begin
        if campaign_id.present? && numbers.present?
          request = Net::HTTP::Post.new("/cloud/1/campaign/#{campaign_id}/call")
          request.set_form_data({"apikey" => @api_key, "numbers" => numbers})
          response = @http.request(request)
          if response.code.to_i == 200 && response['Content-Type'].split(?;).first == 'application/xml'
            body_response = Hash.from_xml(response.body)
            status = body_response["campaignResponse"]["successful"]
            if status.to_s == "true"
              Callfire::Response.new(CALL_SUCCESSFUL_CODE, SUCCESSFUL, {"callid" => body_response["campaignResponse"]["callid"]})
            else
              Callfire::Response.new(CALL_FAIL_CODE, FAIL, {"callid" => body_response["campaignResponse"]["callid"]})
            end
          else
            Callfire::Response.new(CALL_RESPONSE_FAIL_CODE, "Unexpected HTTP response (code=#{response.code})")
          end
        else
          Callfire::Response.new(CALL_ERROR_PARAMS_CODE, "Paramerters invalid")
        end
      rescue
        Callfire::Response.new(EXCEPTION_CODE, "Exception Error : #{$!}")
      ensure
        true
      end
    end

    # This method require set callback url for <www.callfire.com> service
    # when call finish of all campaign or a campaign, campaign finish.
    def set_callback_url(post_url, campaign_id = nil, is_call = false)
      begin
        if post_url.present?
          if is_call
            url = "/cloud/1/reports/callback/campaignfinish/#{campaign_id}"
          else
            url = "/cloud/1/reports/callback/callfinish/#{campaign_id}"
          end 
          request = Net::HTTP::Post.new(url)
          request.set_form_data({"apikey" => @api_key, 'postUrl' => post_url})
          response = @http.request(request)
          if response.code.to_i == 200 && response['Content-Type'].split(?;).first == 'application/xml'
            body_response = Hash.from_xml(response.body)
            status = body_response["reportResponse"]["successful"]
            if status.to_s == "true"
              Callfire::Response.new(CALL_SUCCESSFUL_CODE, body_response["reportResponse"]["description"])
            else
              Callfire::Response.new(CALL_FAIL_CODE, body_response["reportResponse"]["description"])
            end
          else
            Callfire::Response.new(CALL_RESPONSE_FAIL_CODE, "Unexpected HTTP response (code=#{response.code})")
          end
        else
          Callfire::Response.new(CALL_ERROR_PARAMS_CODE, "Paramerters invalid")
        end
      rescue
        Callfire::Response.new(EXCEPTION_CODE, "Exception Error : #{$!}")
      ensure
        true
      end
    end

  end
end