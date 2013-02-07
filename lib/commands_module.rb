module Commands
  def run
    puts 'EventManager initialized'
    @commands = ['load <filename>', 'help', 'help <command>', 'queue count', 'queue clear', 'queue print',
                 'queue print by <attribute>', 'queue save to <filename.csv>', 'find <attribute> <criteria']
    @attributes = %w[regdate first_name last_name email_address phone_number street city state zipcode]
    headers = ['regdate', 'first_name', 'last_name', 'email_address', 'homephone', 'street', 'city', 'state', 'zipcode'].join(',')
    @queue = []
    @csv_results = []
    @csv_results << headers
    command_prompt
  end


  def command_prompt
    command = ''
    while command != 'quit'
      printf 'Enter command: '
      input = gets.downcase.chomp
      parts = input.split(' ')
      if parts[0] == 'queue' && parts[1] == 'save' && parts[2] == 'to'
        command = parts[0..2].join(' ')
        file = parts[3]
      elsif parts[0] == 'queue' && parts[1] == 'print' && parts[2] == 'by'
        command = parts[0..2].join(' ')
        attribute = parts[-1]
      elsif parts[0] == 'queue'
        command = parts[0..-1].join(' ')
      elsif parts[0] == 'find'
        command = parts[0]
        attribute = parts[1]
        criteria = parts[2..-1].join(' ')
      elsif parts[0] == 'help' && parts[1] != nil
        command = parts[0..-1].join(' ')
      else
        command = parts[0]
        file = parts[1]
      end

      case command
        when 'quit' then puts 'Goodbye!'
        when 'load' then check_for_file(file)
        when 'queue count' then queue_count
        when 'queue clear' then queue_clear
        when 'queue print' then queue_print
        when 'queue print by' then queue_print_by_attribute(attribute)
        when 'queue save to' then save_file(file)
        when 'find' then
          if @contents == nil
            puts 'You must load a file before you can perform a search.'
          else
            find_attribute_criteria(attribute, criteria)
          end
        when 'help' then command_list
        when 'help load' then help_tips(command)
        when 'help help' then help_tips(command)
        when 'help queue count' then help_tips(command)
        when 'help queue clear' then help_tips(command)
        when 'help queue print' then help_tips(command)
        when 'help queue print by' then help_tips(command)
        when 'help queue save to' then help_tips(command)
        when 'help find' then help_tips(command)
        else
          puts "Sorry, I don't how to #{command}"
      end
    end
  end
end
