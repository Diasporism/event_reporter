module SaveFile
  def convert_queue_to_csv
    @queue.each do |hash|
      row = hash.values.to_a.join(',')
      @csv_results << row
    end
  end

  def save_file(file)
    filename = "#{file}"
    File.open(filename, 'w') { |file| file.puts @csv_results }
    puts 'File saved successfully'
  end
end