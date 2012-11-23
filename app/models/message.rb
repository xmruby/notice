class Message
  def self.publish_message(ext, city)
    meters = Meter.all
    content = SmsConfig::NOTICE
    i = 0
    meters_valid_phone(meters).each do |meter|
      # sleep 50
      # SmsConfig::REDIS.publish "yy","{\"phone\":\"#{meter.User_Phon}\",\"content\":\"#{content}\",\"ext\":\"#{ext}\",\"app\":\"#{SmsConfig::APP}\",\"city\":\"#{city}\"}"
      SmsConfig::REDIS.publish "yy","{#{i}  ,\"phone\":\"#{meter.User_Phon}\",\"content\":\"#{content}\",\"ext\":\"#{ext}\",\"app\":\"#{SmsConfig::APP}\",\"city\":\"#{city}\"}"
      i = i + 1
    end
  end

  def self.meters_valid_phone(meters)
    meters.select{|m| m.meter_have_valid_phone_num?}
  end
end
