#!/usr/bin/env ruby

require 'rubygems'
gem 'twitter4r'

require 'twitter'
require 'twitter/console'

 # Spell Police's Access
class My_client

  @@t = Twitter::Client
  
  def initialize
    key = "MNzSFNQC2raNCT3alDoR6g"
    secret = "SymhtRyRMinJHQ01GeNM20L4NtLDzwlBNXa3VYTA"

    token = "463514608-6Gd0oT0iVtINKjgCv84tOuCq0teegaxDCrk8Tip5"
    token_secret = "BiRENZ14ApwuFyJ8s5mGV7m6XDQUduv07hkJxpa54"
  @@t.configure do |conf|
      # App configuration
      conf.application_name = 'Grammer'
      conf.application_version = '1.0'
      conf.application_url = 'http://ec2-50-18-16-184.us-west-1.compute.amazonaws.com'

   #  App OAuth token key/secret pair
      conf.oauth_consumer_token = key
      conf.oauth_consumer_secret = secret
    end

    @@key = key
    @@secret = secret
    @@token = token
    @@token_secret = token_secret
    @@cfg = @@t.config
    @@foo = @@t.new(:oauth_access => { :key => @@token, :secret => @@token_secret})
  end
  def foo
    @@foo
  end
# we reuse the cfg variable we set earlier since it contains our app configuration
#k = cfg.oauth_consumer_token
#s = cfg.oauth_consumer_secret
#u = "#{(cfg.protocol == :ssl ? :https : cfg.protocol).to_s}://#{cfg.host}:#{cfg.port}"

#oc = OAuth::Consumer.new(k ,s, :site=> u)

#rt = oc.get_request_token
#auth_url = rt.authorize_url
#puts auth_url
#at = rt.get_access_token(:oauth_verifier=>'7136138')

#user_key = at.token
#user_secret = at.secret
 
    #return client = Twitter::Client.new(:oauth_access => { :key => access_token, :secret => access_secret })
   def bot
    @@t.new(:oauth_access => { :key => @@token, :secret => @@token_secret})
  end
  def bot_test
    @@t.new
  end
end

#client = My_client.new(consumer_key, consumer_secret, access_token, access_secret)
#puts client.bot
#puts client.foo
#puts client.bot_test

#puts client.foo.status :post, 'test, me what'
#puts client.timeline_for :me

#fr = client.my :friends

#puts fr
 
