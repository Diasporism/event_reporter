module ERQueue
  def queue_count
    puts "#{@queue.size} records in queue"
  end

  def queue_clear
    @queue.clear
    @csv_results = [@csv_results[0]]
    puts 'Queue cleared'
  end

  def queue_print
    find_longest_column
    if @queue.size > 0
      print_header
    else
      puts 'Your queue is empty. No results to print'
    end

    @queue.each do |record|
      formatted_record = [record[:last_name].to_s.capitalize, record[:first_name].to_s.capitalize, record[:email_address], record[:zipcode], record[:city], record[:state].to_s.upcase, record[:street], record[:phone_number]]
      puts formatted_record.collect{|h| sprintf("%-#{@longest_key}s", h)}.join
    end
  end

  def queue_print_by_attribute(attribute)
    find_longest_column
    if @queue.size > 0
      print_header
    else
      puts 'Your queue is empty. No results to print'
    end

    sorted_queue = @queue.sort_by{|person| person[attribute.to_sym]}
    sorted_queue.each do |record|
      formatted_record = [record[:last_name].to_s.capitalize, record[:first_name].to_s.capitalize, record[:email_address], record[:zipcode], record[:city], record[:state].to_s.upcase, record[:street], record[:phone_number]]
      puts formatted_record.collect{|h| sprintf("%-#{@longest_key}s", h)}.join
    end
  end

  def print_header
    header = ['LAST NAME', 'FIRST NAME', 'EMAIL ADDRESS', 'ZIPCODE', 'CITY', 'STATE', 'ADDRESS', 'PHONE NUMBER']
    puts header.collect { |h| sprintf("%-#{@longest_key}s", h) }.join
  end

  def find_longest_column
    longest_key_list = []
    @queue.each do |hash|
      long_key = hash.values.max { |a, b| a.length <=> b.length }
      longest_key_list << long_key
    end
    longest_key = longest_key_list.max_by(&:length)
    @longest_key = longest_key.to_s.length + 5
  end
end