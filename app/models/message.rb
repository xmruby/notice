class Message
  def self.publish_message(ext, city)
    meters = Meter.find(:all,:order => "M_Id", :limit => 3)
    content = SmsConfig::NOTICE
    # str = "#{ext}" + "#{city}"

    meters_valid_phone(meters).each do |meter|
      SmsConfig::REDIS.publish "SMS","{\"phone\":\"#{meter.User_Phon}\",\"content\":\"#{content}\",\"ext\":\"#{ext}\",\"app\":\"#{SmsConfig::APP}\",\"city\":\"#{city}\"}"
    end
  end

  def self.meters_valid_phone(meters)
    meters.select{|m| m.meter_have_valid_phone_num?}
  end
end
