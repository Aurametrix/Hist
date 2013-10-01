  task :generate_additional_records => :ewt do
    begin        
      4.times.each do |i|
        #Notifier.cronjob_report("xxx@xxx.com", "Started round #{i+1}").deliver
        City.generate_e_reports(i)
        puts "\n======================================================\n"
        puts "COMPLETED ROUND #{i+1} - will wait an hour from #{Time.zone.now}"
        puts "\n======================================================\n"
        sleep(60*60)
      end
