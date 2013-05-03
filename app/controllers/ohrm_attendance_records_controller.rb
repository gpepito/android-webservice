class OhrmAttendanceRecordsController < ApplicationController
  respond_to :json
  def get_records
    @data=OhrmAttendanceRecord.query(params[:emp_id])
    if @data.blank?
      respond_with("null")
    elsif  
      respond_with(@data.add_time)
    end
  end
  def get_time
    @time={}
    @time.merge!("time" => Time.now)
    respond_with(@time)
  end
  def punch_out
    data=OhrmAttendanceRecord.find(params[:id])
    data.punch_out_utc_time= Time.now
    data.punch_out_time_offset=8
    data.punch_out_user_time=params[:punch_out_user_time]
    data.punch_out_note=params[:punch_out_note]
    data.state=params[:state]
    result=data.save
    #data.errors    
      respond_with(result)
  end  
  def punch_in
    data=OhrmAttendanceRecord.create_attendance(params)
    respond_with(data)
  end
  
end