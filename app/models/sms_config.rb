require "redis"
class SmsConfig
  CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")
  IP = CONFIG["redis_settings"]["ip"]
  PORT = CONFIG["redis_settings"]["port"]
  REDIS = Redis.new(:host => IP, :port => PORT)
  APP = CONFIG["app_settings"]["app"]
  
  NOTICE = CONFIG["notice"]["template"]

  def self.ext(v_ext)
    CONFIG["ext_settings"][v_ext]
  end

  def self.city(v_city)
    CONFIG["city_settings"][v_city]
  end
end
