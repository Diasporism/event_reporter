module ERQueue
  def queue_count
    puts "#{@queue.size} records in queue."
  end

  def queue_clear
    @queue.clear
    @csv_results = [@csv_results[0]]
    puts 'Queue cleared.'
  end

  def check_for_empty_queue
    if @queue.size > 0
      find_longest_key
    else
      puts 'Your queue is empty. No results to print.'
    end
  end

  def queue_print
    check_for_empty_queue

    @queue.each do |record|
      format_record(record)
    end
    @queue.shift
  end

  def queue_print_by_attribute(attribute)


    check_for_empty_queue

    @sorted_queue = @queue[1..-1].sort_by{|person| person[attribute.to_sym]}
    create_sorted_header
    @sorted_queue.each do |record|
      format_record(record)
    end
    @queue.shift

  end

  def format_record(record)
    @formatted_record = [record[:last_name],
                         record[:first_name],
                         record[:email_address],
                         record[:zipcode],
                         record[:city],
                         record[:state],
                         record[:street],
                         record[:phone_number]]

    puts sprintf("%-#{@lk1}s%-#{@lk2}s%-#{@lk3}s%-#{@lk4}s%-#{@lk5}s%-#{@lk6}s%-#{@lk7}s%-#{@lk8}s", *@formatted_record)
  end

  def find_longest_key
    column1 = []
    column2 = []
    column3 = []
    column4 = []
    column5 = []
    column6 = []
    column7 = []
    column8 = []

    create_header

    @queue.each do |hash|
      column1 << hash[:last_name].to_s.length + 5
      column2 << hash[:first_name].to_s.length + 5
      column3 << hash[:email_address].to_s.length + 5
      column4 << hash[:zipcode].to_s.length + 5
      column5 << hash[:city].to_s.length + 5
      column6 << hash[:state].to_s.length + 5
      column7 << hash[:street].to_s.length + 5
      column8 << hash[:phone_number].to_s.length + 5
    end

    @lk1 = column1.max
    @lk2 = column2.max
    @lk3 = column3.max
    @lk4 = column4.max
    @lk5 = column5.max
    @lk6 = column6.max
    @lk7 = column7.max
    @lk8 = column8.max
  end

  def create_header
    @header = {:last_name => 'LAST NAME',
               :first_name => 'FIRST NAME',
               :email_address => 'EMAIL ADDRESS',
               :zipcode => 'ZIPCODE',
               :city => 'CITY',
               :state => 'STATE',
               :street => 'ADDRESS',
               :phone_number => 'PHONE NUMBER'}
    @queue.unshift(@header)
  end

  def create_sorted_header
    @header = {:last_name => 'LAST NAME',
               :first_name => 'FIRST NAME',
               :email_address => 'EMAIL ADDRESS',
               :zipcode => 'ZIPCODE',
               :city => 'CITY',
               :state => 'STATE',
               :street => 'ADDRESS',
               :phone_number => 'PHONE NUMBER'}
    @sorted_queue.unshift(@header)
  end
end