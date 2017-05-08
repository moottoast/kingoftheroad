class Credential
  include Methadone::CLILogging
  include Methadone::SH
  include Methadone::Main
  
  attr_reader :access_key_id, :secret_access_key

  def initialize(credential_file)
    @credential_file = credential_file

    credential_array = CSV.read(@credential_file)

    @access_key_id = credential_array[1][0]
    @secret_access_key = credential_array[1][1]
  end

  
end
