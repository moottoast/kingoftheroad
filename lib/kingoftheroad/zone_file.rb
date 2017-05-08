class ZoneFile
  include Methadone::CLILogging
  include Methadone::SH
  include Methadone::Main

  def initialize(zone_file)
    @zone_file = zone_file
  end

  def parse
    parsed_file = Hash.new
    current_zone = ''

    CSV.foreach(@zone_file, { col_sep: " ", quote_char: "\x00" }) do |row|
      if row[0] == ';' && row[1] == 'Zone'
        current_zone = row[2]
        parsed_file["#{current_zone}"] = Array.new
      else
        parsed_file["#{current_zone}"].push(row) unless row[0] == ''
      end
    end
    parsed_file
  end
end
