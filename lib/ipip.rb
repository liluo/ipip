require 'ipip/version'
require 'ipip/ipv4_database'

module IPIP

  class << IPIP

    def find(ip)
      ipv4_database.find(ip)
    end

    def ipv4_database(data_file=nil)
      @ipv4_database ||= IPv4Database.new(data_file)
    end

  end

end
