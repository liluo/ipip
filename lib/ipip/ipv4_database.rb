require 'socket'
require 'ipaddr'

module IPIP

  # Database for search IPv4 address.
  #
  #  The IPIP.net data file(17monipdb.dat) format in bytes::
  #
  #     ---------------------------
  #     | 4 bytes                 |             <- offset number
  #     ---------------------------
  #     | 256 * 4 bytes           |             <- first ip number index
  #     ---------------------------
  #     | offset - 1024 - 4 bytes |             <- ip index
  #     ---------------------------
  #     |    data  storage        |
  #     ---------------------------
  #
  class IPv4Database

    OFFSET_NUMBER_SIZE = 4
    FIRST_IP_NUMBER_INDEX_SIZE = 256 * 4
    IP_BLOCK_SIZE = 8
    DEFAULT_DATA_FILE = File.expand_path("../17monipdb.dat", __FILE__)

    def initialize(data_file=nil)
      @data_file = data_file || DEFAULT_DATA_FILE
    end

    def find(ip)
      ip = IPSocket::getaddress(ip)
      lookup_ipv4(ip)
    end

    private

    def offset
      @offset ||= unpack_N(binread(OFFSET_NUMBER_SIZE, 0))
    end

    def buffer
      @buffer ||= binread(nil, OFFSET_NUMBER_SIZE)
    end

    def binread(length, offset)
      IO.binread(@data_file, length, offset)
    end

    def lookup_ipv4(ip)
      ip = IPAddr.new(ip)
      return unless ip.ipv4?

      nip = ip.hton

      first_ip = unpack_C(nip)
      first_ip_offset = first_ip * 4

      start = unpack_V(buffer[first_ip_offset, 4])
      start_offset = start * IP_BLOCK_SIZE + FIRST_IP_NUMBER_INDEX_SIZE

      data_offset = data_length = 0

      lo, hi = 0, (offset - start_offset) / IP_BLOCK_SIZE

      while lo < hi
        mid = (lo + hi) / 2
        mid_offset = start_offset + mid * IP_BLOCK_SIZE
        mid_val = buffer[mid_offset, 4]

        if mid_val < nip
          lo = mid + 1
        else
          hi = mid
        end
      end

      start_offset += lo * IP_BLOCK_SIZE
      return if start_offset == offset

      data_offset = unpack_V(buffer[start_offset + 4, 3] + 0.chr)
      data_length = unpack_C(buffer[start_offset + 7])

      data_offset = offset + data_offset - FIRST_IP_NUMBER_INDEX_SIZE - OFFSET_NUMBER_SIZE
      data = buffer[data_offset, data_length].encode('UTF-8', 'UTF-8')
    end

    [:C, :N, :V].each do |format|
      define_method "unpack_#{format}" do |binary|
        binary.unpack(format.to_s).first
      end
    end
  end
end
