# encoding: utf-8
class Meter < ActiveRecord::Base
  set_table_name "Meter"
  set_primary_key :M_Id

  def self.sms_substitude
  	
  end

  def meter_have_valid_phone_num?
  	self.User_Phon.length == 11
  end
end