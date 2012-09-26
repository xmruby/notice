class Task
  class << self
    %w(wlg dw bq aq tq dl ds lq hq ks hd).each do |v|
      define_method "#{v}_task" do
        select_connection(v)
        Message.publish_message(SmsConfig.ext("#{v}_ext"), SmsConfig.city("#{v}_city"))
      end
    end
  end

  private

  def self.select_connection(v)
    Meter.establish_connection v
  end
end
