# Docker

## Desenvolvimento local

Para rodar o projeto com Docker:

```bash
# Build e start dos containers
docker-compose up --build

# Ou em background
docker-compose up -d --build
```

O servidor estará disponível em `http://localhost:3000`

### O que acontece ao iniciar:

1. Build da imagem Docker
2. Instala as gems
3. Prepara o banco de dados (`rails db:prepare`)
4. Executa os seeds (`rails db:seed`) - **20 anotações de exemplo**
5. Inicia o servidor Rails

### Comandos úteis:

```bash
# Ver logs
docker-compose logs -f

# Parar containers
docker-compose down

# Executar comandos no container
docker-compose exec web bash
docker-compose exec web rails console
docker-compose exec web rails test

# Rebuild completo (limpa cache)
docker-compose down -v
docker-compose up --build
```

### Estrutura:

- `Dockerfile.dev` - Imagem Docker para desenvolvimento
- `docker-compose.yml` - Orquestração dos serviços
- Volume `bundle_cache` - Cache das gems instaladas
- Volume `.:/rails` - Código sincronizado com o container
