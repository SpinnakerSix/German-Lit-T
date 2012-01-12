#!/usr/bin/env ruby

require 'rubygems'
gem 'twitter4r'

require 'twitter'
require 'twitter/console'

 # Spell Police's Access
    consumer_key = "joDN99hlWSrAGHdBkYG1Pg"
    consumer_secret = "fkeijYl6vpvZ0idhxuNKGklItISJALicGhfuxNMtHDg"

    access_token = "461552116-WeeKKcBqNB0YLAtE0p0BkdL4H4XVu2Wl1je56R2M"
    access_secret = "qGeVQ24fBNQGcdyuo51LTUsQiAhC3SKqqCR3hEpcrc"

class My_client

  @@t = Twitter::Client
  
  def initialize
    # Spell bee's Acces
    #key = "Fp4A5JL2D7UmFQmkIOHHg"
    #secret = "j77KXoBpWCBeZ8nvklZ46eNSzUpO90IquDxR5Vwc7Bs"

    #token = "460085026-yTWvBkpy1JbHmMFltr3pVbYLjfDHONKzps1Etkie"
    #token_secret = "5xeKne1C8GNesWpOWykgwHmtwJam9kOqDFM5QdCU"

    #key = "joDN99hlWSrAGHdBkYG1Pg"
    #secret = "fkeijYl6vpvZ0idhxuNKGklItISJALicGhfuxNMtHDg"

    #token = "461552116-WeeKKcBqNB0YLAtE0p0BkdL4H4XVu2Wl1je56R2M"
    #token_secret = "qGeVQ24fBNQGcdyuo51LTUsQiAhC3SKqqCR3hEpcrc"
    

  key = "r22DF13xcawc9z6sz4WjVg"
    secret = "srSpeADqfvMRH8QDK3wF1pt5YzfX9FWmXZEP9330YI"

    token = "461552116-Luk7cuu49bidiiVgiCYgsMWJlTMnz4ZA1qvz4zQ1"
    token_secret = "luXDCa6K6zQwwAoCLwKpLm1oDk4OojueiVNz2kI"
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
 
