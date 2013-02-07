module Help
  def help_tips(input)
    help = YAML::load(File.open('help.yml'))
    case input
      when 'help' then puts help['help']['command list']
      when 'help load' then puts help['help']['load']
      when 'help help' then puts help['help']['help']
      when 'help queue count' then puts help['help']['queue count']
      when 'help queue clear' then puts help['help']['queue clear']
      when 'help queue print' then puts help['help']['queue print']
      when 'help queue print by' then puts help['help']['queue print by']
      when 'help queue save to' then puts help['help']['queue save to']
      when 'help find' then puts help['help']['find']
      else puts 'I do not know that command.'
    end
  end
end