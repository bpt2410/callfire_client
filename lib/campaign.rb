# callfire-client - <www.callfire.com> service accessing library.
# Copyright (C) 2012  TP. Ho Chi Minh, Viet Nam  <phutuong24101990@gmail.com>.
# <callfire-client> provider functions send call to <www.callfire.com>
# See callfire-client for documentation.
module Callfire
  class Campaign
    def initialize(id, description)
      @id, @description = id , description
    end
    def <=>(other)
      @id <=> other.id
    end
    attr_accessor :id, :description
  end
end