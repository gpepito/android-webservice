class OhrmAttendanceRecord < ActiveRecord::Base
  attr_accessible :employee_id,:punch_in_utc_time,:punch_in_note,:punch_in_time_offset,:punch_in_user_time,:state
  def self.query(emp_id)
     self.where(:employee_id=>emp_id,:punch_out_user_time=>nil,:state=>"PUNCHED IN").first
  end

  def add_time
    h_values={}
    self.attributes.each do |k,v|
      h_values.merge!(k => self.send(k))
    end
    h_values.merge!("time" => Time.now)

  end

 def self.create_attendance(params)
    new_records={
      :employee_id=> params[:employee_id],
      :punch_in_utc_time=>Time.now,
      :punch_in_note=> params[:punch_in_note],
      :punch_in_time_offset=> params[:punch_in_time_offset],
      :punch_in_user_time=> params[:punch_in_user_time],
      :state=> params[:state]
    }
    OhrmAttendanceRecord.create(new_records)    
  end
end
