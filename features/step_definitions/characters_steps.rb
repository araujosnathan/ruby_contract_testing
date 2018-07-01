
Dado("que usuário acesse a URL base da Marvel API") do
    @marvel_api = Request
end
  
Dado("configure suas credenciais válidas") do
    @timestamp = Time.now.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
    @keys =  CREDENCIAIS["user".to_sym]
    user = Auth.new(@keys[:private_key], @keys[:public_key])
    @hash = user.get_hash(@timestamp)
end
  
Dado("que acesse o endpoint de listagem para {int} personagens") do |quantidade_personagens|
    endpoints = CREDENCIAIS["marvel_api".to_sym]
    @response = @marvel_api.get(endpoints[:list_characters] + "?limit=#{quantidade_personagens}&ts=#{@timestamp}&apikey=#{@keys[:public_key]}&hash=#{@hash}");
end
  
Então("o endpoint deve retornar a lista dos personagens com o contrato de acordo com a documentação") do
    schemas =  SchemaCharacters.new
    schema_list_characters =  schemas.get_list_characters
    expect(JSON::Validator.validate!(schema_list_characters, @response.body)).to be(true)
end

Dado("que usuário possua um ID de um personagem") do
    steps %{
        Dado que acesse o endpoint de listagem para 5 personagens
    }
    @character_id = @response['data']['results'][0]['id']
end
  
Quando("acessar endpoint para buscar informações desse personagem") do
    endpoints = CREDENCIAIS["marvel_api".to_sym]
    @response = @marvel_api.get(endpoints[:list_characters] + "/#{@character_id}?ts=#{@timestamp}&apikey=#{@keys[:public_key]}&hash=#{@hash}");
end
  
Então("o endpoint deve retornar as informações com o contrato de acordo com a documentação") do
    schemas =  SchemaCharacters.new
    schema_list_characters =  schemas.get_list_characters
    expect(JSON::Validator.validate!(schema_list_characters, @response.body)).to be(true)
end

Quando("acessar enpoint de filtro de commics") do
    endpoints = CREDENCIAIS["marvel_api".to_sym]
    @response = @marvel_api.get(endpoints[:list_characters] + "/#{@character_id}/comics?ts=#{@timestamp}&apikey=#{@keys[:public_key]}&hash=#{@hash}");
end
  
  Então("enpoint deve retornar filtro de comics de persoangem com o contrato de acordo com a documentação") do
    schemas =  SchemaCharacters.new
    schema_comics_characters =  schemas.get_comics_characters
    expect(JSON::Validator.validate!(schema_comics_characters, @response.body)).to be(true)
  end