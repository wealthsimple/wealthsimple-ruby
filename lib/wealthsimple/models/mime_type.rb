require 'date'

module Wealthsimple
  class MimeType
    
    APPLICATIONJSON = "application/json".freeze
    APPLICATIONXML = "application/xml".freeze
    APPLICATIONPDF = "application/pdf".freeze
    IMAGEPN = "image/pn".freeze
    IMAGEJPEG = "image/jpeg".freeze
    IMAGEGIF = "image/gif".freeze
    TEXTHTML = "text/html".freeze
    TEXTPLAIN = "text/plain".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = MimeType.constants.select{|c| MimeType::const_get(c) == value}
      raise "Invalid ENUM value #{value} for class #MimeType" if constantValues.empty?
      value
    end
  end

end
