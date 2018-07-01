# language: pt

Funcionalidade: Informações sobre personagens

    Contexto: 
        Dado que usuário acesse a URL base da Marvel API
        E configure suas credenciais válidas

    Cenário: Usuário consegue listar 5 personagens da Marvel Comic
        Dado que acesse o endpoint de listagem para 5 personagens
        Então o endpoint deve retornar a lista dos personagens com o contrato de acordo com a documentação 

    Cenário: Usuário consegue listar informações de um personagem específico
        Dado que usuário possua um ID de um personagem
        Quando acessar endpoint para buscar informações desse personagem
        Então o endpoint deve retornar as informações com o contrato de acordo com a documentação
    
    Cenário: Usuário consegue filtrar commics de acordo com personagem específico
        Dado que usuário possua um ID de um personagem
        Quando acessar enpoint de filtro de commics
        Então enpoint deve retornar filtro de comics de persoangem com o contrato de acordo com a documentação