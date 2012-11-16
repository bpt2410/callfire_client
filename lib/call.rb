module Callfire
  class Call
    def initialize(id, campaignid, phonenumber,
        disposition, duration,
        callstart, notes = nil,
        extra_data= nil, agentid = nil,
        agentresponse = nil, responsetime = nil,
        stored_data = nil, recordings = nil)
      @id, @campaignid, @phonenumber,
        @disposition, @duration, @callstart,
        @notes, @extra_data, @agentid,
        @agentresponse, @responsetime,
        @stored_data, @recordings  = id, campaignid, phonenumber,
        disposition, duration, callstart,
        notes, extra_data, agentid,
        agentresponse, responsetime,
        stored_data, recordings
    end
    def <=>(other)
      @id <=> other.id
    end
    attr_accessor :id, :campaignid, :phonenumber,
        :disposition, :duration, :callstart,
        :notes, :extra_data, :agentid,
        :agentresponse, :responsetime,
        :stored_data, :recordings
  end
end
