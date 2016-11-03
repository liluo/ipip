# coding: utf-8

RSpec.describe IPIP do

  describe '#find' do

    shared_examples 'should return location' do |ip, location|
      it "should return #{location} when find #{ip}" do
        expect(IPIP.find(ip)).to eql location
      end
    end

    it_behaves_like 'should return location', '127.0.0.1', "本机地址\t本机地址\t\t"

    it_behaves_like 'should return location', '8.8.8.8', "GOOGLE\tGOOGLE\t\t"
    it_behaves_like 'should return location', '114.114.114.114', "114DNS\t114DNS\t\t"

    it_behaves_like 'should return location', '211.147.4.49', "中国\t北京\t北京\t"
    it_behaves_like 'should return location', '202.195.161.30', "中国\t江苏\t镇江\t"
    it_behaves_like 'should return location', '192.30.252.129', "美国\t美国\t\t"

    it_behaves_like 'should return location', 'douban.com', "中国\t北京\t北京\t"

  end
end
