# Keep Annotation API

API REST para gerenciar anotações utilizando arquitetura Use Case.

O frontend se encontra nesse [repositório](https://github.com/NelcifranMagalhaes/keepAnnotationFrontend)

## Tecnologias

- Ruby 3.3.6
- Rails 8.1.2
- SQLite3
- Pagy (paginação)
- Docker

## Setup Local (sem Docker)

```bash
# Instalar dependências
bundle install

# Preparar banco de dados e seeds
rails db:migrate
rails db:seed

# Iniciar servidor
rails server
```

## Setup com Docker

```bash
# Build e iniciar
docker-compose up --build

# Em background
docker-compose up -d --build
```

Ver [DOCKER.md](DOCKER.md) para mais detalhes.

## API Endpoints

### Listar Anotações (com paginação)
```bash
GET /annotations
GET /annotations?page=2
GET /annotations?per_page=5&page=1
```

Response:
```json
{
  "data": [
    {
      "id": 1,
      "title": "Annotation 1",
      "content": "...",
      "created_at": "2026-02-25T...",
      "updated_at": "2026-02-25T..."
    }
  ],
  "pagination": {
    "page": 1,
    "per_page": 10,
    "total": 20,
    "total_pages": 2
  }
}
```

### Visualizar Anotação
```bash
GET /annotations/:id
```

### Criar Anotação
```bash
POST /annotations
Content-Type: application/json

{
  "annotation": {
    "title": "Minha Anotação",
    "content": "Conteúdo da anotação"
  }
}
```

### Atualizar Anotação
```bash
PATCH /annotations/:id
Content-Type: application/json

{
  "annotation": {
    "title": "Título Atualizado"
  }
}
```

### Deletar Anotação
```bash
DELETE /annotations/:id
```

## Arquitetura

O projeto utiliza **arquitetura Use Case** para separação de responsabilidades.

Ver [USE_CASE_ARCHITECTURE.md](USE_CASE_ARCHITECTURE.md) para detalhes.

### Estrutura:
```
app/
├── controllers/     # Orquestração HTTP
├── use_cases/       # Lógica de negócio
├── models/          # Modelos de dados
└── services/        # Serviços auxiliares
```

## Testes

```bash
# Rodar todos os testes
rails test

# Teste específico
rails test test/use_cases/annotations/create_test.rb
```

## Seeds

O projeto vem com 20 anotações de exemplo:

```bash
rails db:seed
```

## Licença

MIT
