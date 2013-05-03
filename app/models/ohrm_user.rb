class OhrmUser < ActiveRecord::Base
  # attr_accessible :title, :body

  def self.compare(username)
	OhrmUser.where(:user_name=>username).first
  end

  def self.login(username,password)
    self.where(:user_name=>username,:user_password=>password).first
   # self.all
  end
  def add_time
    h_values={}
    self.attributes.each do |k,v|
      h_values.merge!(k => self.send(k))
    end
    h_values.merge!("time" => Time.now)

  end
end
