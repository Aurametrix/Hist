
  def e_data(date)
    q = {:q => param1.blank? ? "#{var1},#{var2}" : "#{get1},#{get2},#{get3}", :format => "json", :date => date.strftime("%Y-%m-%d"), :num_of_days => 1, :key => @@key}
    sleep(1.2)
    Nestful.get("http://xxxx", :params => q, :timeout => 3, :format => :json)["data"]
  rescue
    {"e" => {}}
  end
