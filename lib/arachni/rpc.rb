=begin
                  Arachni
  Copyright (c) 2010-2011 Tasos "Zapotek" Laskos <tasos.laskos@gmail.com>

  This is free software; you can copy and distribute and modify
  this program under the term of the GPL v2.0 License
  (See LICENSE file for details)

=end

require 'eventmachine'
require 'socket'
require 'set'
require 'logger'
require 'yaml'

require File.join( File.expand_path( File.dirname( __FILE__ ) ), 'rpc', 'exceptions' )
require File.join( File.expand_path( File.dirname( __FILE__ ) ), 'rpc', 'server' )
require File.join( File.expand_path( File.dirname( __FILE__ ) ), 'rpc', 'client' )
require File.join( File.expand_path( File.dirname( __FILE__ ) ), 'rpc', 'em' )
require 'yaml'

module Arachni
module RPC
    VERSION = '0.1'
end
end