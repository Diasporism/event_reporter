module LoadFile
  def check_for_file(file)
    if file == nil
      puts 'No file declared. Loading event_attendees.csv by default.'
      load_file
    elsif File.exist?(file)
      load_file(file)
    else
      puts 'No file exists by that name. Load event_attendees.csv by default.'
      load_file
    end
  end

  def load_file(file='event_attendees.csv')
    @contents = CSV.open file, headers: true, header_converters: :symbol
    parse_csv_file
    puts "#{file} loaded"
  end

  def parse_csv_file
    @records = []
    @contents.each do |row|
      record = {
          :regdate => row[:regdate],
          :first_name => row[:first_name].to_s.downcase,
          :last_name => row[:last_name].to_s.downcase,
          :email_address => row[:email_address].to_s.downcase,
          :phone_number => PhoneNumber.new(row[:homephone]).check_valid_phone_number,
          :street => row[:street].to_s.downcase,
          :city => row[:city].to_s.downcase,
          :state => row[:state].to_s.downcase,
          :zipcode => Zipcodes.new(row[:zipcode]).to_s
      }
      @records << record
    end
  end
end