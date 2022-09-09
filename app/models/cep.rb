require 'net/http'

class CEP
    attr_reader :logradouro, :bairro, :localidade, :uf

    def initialize(zip_code)
        zip_code_found = find_zip_code(zip_code)
        fill_data(zip_code_found)
    end

    def endereco
        "#{@logradouro}, #{@bairro}, #{@localidade} - #{@uf}"
    end

    private

    def fill_data(zip_code_found)
        @logradouro = zip_code_found["logradouro"]
        @bairro     = zip_code_found["bairro"]
        @localidade = zip_code_found["localidade"]
        @uf         = zip_code_found["uf"]
    end

    def find_zip_code(zip_code)
        ActiveSupport::JSON.decode(
            Net::HTTP.get(
                URI("https://viacep.com.br/ws/#{zip_code}/json/")
            )
        )
    end
end