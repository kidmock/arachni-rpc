=begin
                  Arachni-RPC
  Copyright (c) 2011 Tasos "Zapotek" Laskos <tasos.laskos@gmail.com>

  This is free software; you can copy and distribute and modify
  this program under the term of the GPL v2.0 License
  (See LICENSE file for details)

=end

require File.join( File.expand_path( File.dirname( __FILE__ ) ), '../', 'rpc' )

module Arachni
module RPC

#
# Represents an RPC response.
#
# It's here only for formalization purposes, it's not actually sent over the wire.
#
# What is sent is a hash generated by {#prepare_for_tx}
# which is in the form of:
#
#
#    {
#        # result of the RPC call
#        'obj'       => object
#    }
#
# @author: Tasos "Zapotek" Laskos
#                                      <tasos.laskos@gmail.com>
#                                      <zapotek@segfault.gr>
# @version: 0.1
#
class Response < Message

    #
    # Return object of the {Request#message}.
    #
    # If there was an exception it will hold a Hash like:
    #
    #    {
    #        "exception" => "Trying to access non-existent object 'blah'.",
    #        "backtrace" => [
    #            [0] "/home/zapotek/workspace/arachni-rpc/lib/arachni/rpc/server.rb:285:in `call'",
    #            [1] "/home/zapotek/workspace/arachni-rpc/lib/arachni/rpc/server.rb:85:in `block in receive_object'",
    #            [2] "/home/zapotek/.rvm/gems/ruby-1.9.2-p180/gems/eventmachine-1.0.0.beta.3/lib/eventmachine.rb:1009:in `call'",
    #            [3] "/home/zapotek/.rvm/gems/ruby-1.9.2-p180/gems/eventmachine-1.0.0.beta.3/lib/eventmachine.rb:1009:in `block in spawn_threadpool'"
    #        ],
    #             "type" => "InvalidObject"
    #    }
    #
    # For all available exception types look at {Exceptions}.
    #
    # @return   [Object]
    #
    attr_accessor :obj

    # @see Message#initialize
    def initialize( * )
        super

        @async = false
    end

    def async?
        @async
    end

    def async!
        @async = true
    end

    private

    def transmit?( attr )
        ![
            :@async
        ].include?( attr )
    end


end

end
end
