# coding: utf-8

RSpec.describe IPIP::IPv4Database do

  describe '.find' do

    let(:ipv4_database) { IPIP::IPv4Database.new }

    context 'when ip v4' do
      shared_examples 'should return location' do |ip, location|
        it "should return #{location} when find #{ip}" do
          expect(ipv4_database.find(ip)).to eql location
        end
      end

      it_behaves_like 'should return location', '127.0.0.1', "本机地址\t本机地址\t\t"

      it_behaves_like 'should return location', '8.8.8.8', "GOOGLE\tGOOGLE\t\t"
      it_behaves_like 'should return location', '114.114.114.114', "114DNS\t114DNS\t\t"

      it_behaves_like 'should return location', '211.147.4.49', "中国\t北京\t北京\t"
      it_behaves_like 'should return location', '202.195.161.30', "中国\t江苏\t镇江\t"

      it_behaves_like 'should return location', '192.30.252.129', "美国\t美国\t\t"
      it_behaves_like 'should return location', '225.109.248.81', ""
    end

    context 'when domain' do
      shared_examples 'should return location' do |domain|
        it "should return location when find #{domain}" do
          expect(ipv4_database.find(domain)).not_to be_nil
        end
      end

      it_behaves_like 'should return location', 'google.com'
      it_behaves_like 'should return location', 'douban.com'
    end

    context 'when ip v6' do
      shared_examples 'should return nil' do |ip|
        it "should return nil when find #{ip}" do
          expect(ipv4_database.find(ip)).to be_nil
        end
      end

      it_behaves_like 'should return nil', '2404:6800:4005:800::200e'
      it_behaves_like 'should return nil', '2402:f000:1:404:166:111:4:100'
    end

  end

end
