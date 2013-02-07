module Find
  def find_attribute_criteria(attribute, criteria)
    @queue.clear
    @csv_results = [@csv_results[0]]
    case attribute
      when 'regdate' then
        find_results(:regdate, criteria)
      when 'first_name' then
        find_results(:first_name, criteria)
      when 'last_name' then
        find_results(:last_name, criteria)
      when 'email_address' then
        find_results(:email_address, criteria)
      when 'phone_number' then
        find_results(:phone_number, criteria)
      when 'street' then
        find_results(:street, criteria)
      when 'city' then
        find_results(:city, criteria)
      when 'state' then
        find_results(:state, criteria)
      when 'zipcode' then
        find_results(:zipcode, criteria)
      else
        puts "I don't know that attribute. Try one of the following instead:"
        @attributes.each { |attribute| puts attribute }
    end
  end

  def find_results(attribute, criteria)
    @records.each do |row|
      if  row[attribute] == criteria
        @queue << row
      end
    end
    if @queue.size == 0
      puts 'No results found'
    else
      puts "#{@queue.size} results found"
      convert_queue_to_csv
    end
  end
end