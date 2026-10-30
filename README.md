# rAthena Manager - CasaOS App

Aplicativo para CasaOS que gerencia emuladores rAthena e Hercules.

## Funcionalidades

- **Seleção de Emulador**: Escolha entre rAthena ou Hercules
- **Pasta Padrão**: `/opt/rathena` ou `/opt/hercules`
- **Atualização Automática**: Puxa as últimas commits via Git
- **Status em Tempo Real**: API para verificar o status do emulador
- **Interface Responsiva**: Funciona em desktop e mobile

## Como Usar no CasaOS

### Importando o Aplicativo

1. No CasaOS, vá até "Aplicativos" → "Importar Aplicativo"
2. Selecione o arquivo `docker-compose.yml` desta pasta
3. Aguarde o CasaOS analisar o compose file

### Configuração Inicial

Após importar, o CasaOS exibirá uma tela de configuração com:

| Variável | Descrição | Padrão |
|---|---|---|
| `EMULATOR_TYPE` | Tipo de emulador a instalar | `rathena` |
| `INSTALL_PATH` | Pasta onde o emulador será instalado | `/opt/rathena` |
| `GIT_REPO` | repositório Git (opcional) |Repositório correspondente ao tipo|
| `GIT_BRANCH` | Branch para checkout | `master` |

### Depois de Configurado

1. Clique em "Baixar/Atualizar Emulador" na interface
2. O sistema clonará ou fará pull do repositório selecionado
3. O emulador estará disponível em `/opt/rathena` ou `/opt/hercules`
4. Acesse `http://localhost:8081` para ver o status

### Acessando o Emulador

- **Interface Web**: `http://localhost:8081`
- **API Status**: `http://localhost:8081/api/status`
- **Painel Config**: Interface inicial do aplicativo

## Estrutura de Arquivos

```
/www/app/
  info.json          # Metadados do CasaOS
  docker-compose.yml # Configuração Docker
nginx-config/
  default.conf     # Configuração Nginx
www/html/
  index.html       # Interface de configuração
```

## Desenvolvimento

### Testando Localmente

```bash
# Iniciar o compose
docker compose up -d

# Verificar status
curl http://localhost:8081/api/status

# Acessar interface
open http://localhost:8081
```

### Variáveis de Ambiente

Pode ser definido via `.env` ou diretamente no CasaOS:

```bash
EMULATOR_TYPE=hercules
INSTALL_PATH=/opt/hercules
GIT_REPO=https://github.com/HerculesWS/Hercules
GIT_BRANCH=master
```

## Próximas Features

- [ ] Interface gráfica para gerenciar múltiplas instâncias
- [ ] Logs em tempo real via WebSocket
- [ ] Scripts de build e compilação
- [ ] Backup e restauração de configs
- [ ] Suporte a mais emuladores