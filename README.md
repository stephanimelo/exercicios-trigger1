# Exercício 01 de Trigger - Log da tabela Professor

**Enunciado:** Criar trigger para registrar um LOG das atualizações da tabela Professor, contendo: código do usuário que fez a alteração, chave primária do registro alterado, tipo de alteração (INSERT, UPDATE ou DELETE) e data e hora da alteração.

Script (estrutura da tabela de log e trigger): [trigger_log_professor.sql](trigger_log_professor.sql)

## Estrutura da tabela de log

| Coluna | Descrição |
|---|---|
| IdLog | Identificador do registro de log |
| CodUsuario | Usuário que fez a alteração |
| CodProfAlterado | Chave primária (CodProf) do registro alterado |
| TipoAlteracao | INSERT, UPDATE ou DELETE |
| DataHora | Data e hora da alteração |

## Resultado do teste

<img src="log1.PNG" width="600"/>
