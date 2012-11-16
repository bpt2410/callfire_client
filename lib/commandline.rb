# To change this template, choose Tools | Templates
# and open the template in the editor.

module Callfire
  class CommandLine
    def self.execute(options={})
      new(options).run
    end

    def initialize(options={})
      @options = options
    end

    def run
      if @options[:version]
        puts "Callfire client v#{Callfire::VERSION}"
      end

      if @options[:sendcall]
        if @options[:sendcall].count !=3
          puts "Parameter invalid! Try Again!"
          return false
        end
        call_fire = Callfire::Client.new(@options[:sendcall][0])
        response = call_fire.send_call(@options[:sendcall][1], @options[:sendcall][2])
        puts response.to_json
      end

      if @options[:callback]
        puts @options[:callback].count
        puts @options[:callback].to_json
        if @options[:callback].count < 2
          puts "Parameter invalid! Try Again!"
          return false
        end
        call_fire = Callfire::Client.new(@options[:callback][0])
        post_url = @options[:callback][1]
        campaign_id = (@options[:callback].count > 2) ? @options[:callback][2]  : nil
        is_call = false
        if (@options[:callback].count == 4 && (@options[:callback][3].to_i == 1 || @options[:callback][3].to_s =="true"))
          is_call = @options[:callback][3]
        end
        
        response = call_fire.set_callback_url(post_url, campaign_id, is_call)
        puts response.to_json
      end
      
    end
  end
end
