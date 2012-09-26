class Message
  def self.publish_message(ext, city)
    meters = Meter.all
    content = SmsConfig::NOTICE

    meters_valid_phone(meters).each do |meter|
      SmsConfig::REDIS.publish "SMS","{\"phone\":\"#{meter.User_Phon}\",\"content\":\"#{content}\",\"ext\":\"#{ext}\",\"app\":\"#{SmsConfig::APP}\",\"city\":\"#{city}\"}"
    end
  end

  def self.meters_valid_phone(meters)
    meters.select{|m| m.meter_have_valid_phone_num?}
  end
end
