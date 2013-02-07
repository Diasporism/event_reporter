require 'csv'

class CSVFile

  def initialize(filename)
    open(filename)
  end

  def to_s

  end

  def open(filename)
    CSV.open filename, headers: true, header_converters: :symbol
  end

end
