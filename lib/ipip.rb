require 'ipip/version'
require 'ipip/ipv4_database'
require 'ipip/ipv4_database_x'


module IPIP

  class << self

    def find(ip)
      ipv4_database.find(ip)
    end

    def load_data!(data_file)
      raise 'No such file' unless File.exists?(data_file)

      ipv4_database(data_file)
    end

    def ipv4_database(data_file = nil)
      @ipv4_database ||= IPv4Database.new(data_file)
    end

  end

end


module IPIPX

  class << self

    def find(ip)
      raise 'pls call `IPIPX.load_data!` first' unless data_loaded?

      ipv4_database.find(ip)
    end

    def load_data!(data_file)
      raise 'No such file' unless File.exists?(data_file)

      ipv4_database(data_file)
      @data_was_loaded = true
    end

    def ipv4_database(data_file = nil)
      @ipv4_database ||= IPv4DatabaseX.new(data_file)
    end

    def data_loaded?
      @data_was_loaded ||= false
    end

  end

end
