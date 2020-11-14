class Url < ApplicationRecord
    has_many :analytics, class_name: "Analytic", foreign_key: "url_id"

    validates :full_url, presence: true, format: URI::regexp(%w[http https])
    validates :short_url, presence: true
    validates_length_of :full_url, within: 3..255, on: :create, message: "too long"
    validates_length_of :short_url, within: 3..255, on: :create, message: "too long"

    CHARACTERS = [*'0'..'9', *'a'..'z', *'A'..'Z']
    
    def short
        short_code = Array.new(5) { CHARACTERS.sample }.join
        return "http://localhost:3000/#{short_code}"
    end
end