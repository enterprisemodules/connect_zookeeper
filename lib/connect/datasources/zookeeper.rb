require 'method_hash'
require 'hash_extensions'
begin
  require 'zk'
rescue LoadError
end


module Connect
  module Datasources
    ##
    #
    # The base class for ZooKeeper data sources
    #
    #
    class Zookeeper < Base
      def initialize( name, server = 'zookeeper:2181')
        unless defined?(ZK)
          fail "Fetching data from ZooKeeper requires the ZK gem"
        end
        @connection = ZK.new(server)
      end

      def to_connect(value)
        if value.nil?
          nil
        else
          value = ::MethodHash[value.marshal_dump]
          value.extend(HashExtensions)
          value.stringify_keys
        end
      end

      def lookup(key)
        begin
        if child?(key)
          @connection.children(key).first
        else
          @connection.get(key).first
        end
        rescue ZK::Exceptions::NoNode
          throw :no_such_key
        end
      end

      private

      def child?(path)
        path[-1] == '/'
      end


    end
  end
end
