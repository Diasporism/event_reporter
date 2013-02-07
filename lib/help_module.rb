module Help
  def help_tips(input)
    case input
      when 'help load' then
        puts 'load : loads a designated file. If no file is designated, a default file is loaded (event_attendees.csv)'
        puts 'Example: load fuzzy_bunnies.csv'
      when 'help help' then
        puts 'help : prints a list of commands you can enter'
      when 'help queue count' then
        puts 'queue count : shows the total number of records your last query returned'
      when 'help queue clear' then
        puts 'queue clear : resets the queue count back to 0'
      when 'help queue print' then
        puts 'queue print : prints out a list of records that your last query returned'
      when 'help queue print by' then
        puts 'queue print by : prints out a list of records that your last query returned sorted alphabetically by whichever attribute you specify'
        puts 'Example: queue print by first_name (this will sort the list by first name)'
      when 'help queue save to' then
        puts 'queue save to : saves the list of records returned from your last query to a file. Specify the name after the command'
        puts 'Example: queue save to fuzzy_bunnies.csv (this will save your current record list to a file name fuzzie_bunnies.csv)'
      when 'help find' then
        puts 'find : attempts to search for and return a list of records based on an attribute and criteria'
        puts 'Example: find first_name sarah (returns all records which have a first name of sarah'
      else
        puts 'I do not know that command. Try one of these instead:'
        @commands.each { |command| puts command }
    end
  end

  def command_list
    puts 'List of commands:'
    @commands.each_with_index { |command, index| puts "#{index + 1}. #{command}" }
  end
end