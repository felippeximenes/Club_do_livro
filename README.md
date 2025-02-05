# Projeto de Banco de Dados MySQL


![Captura de tela 2025-02-04 165213](https://github.com/user-attachments/assets/e14508e4-0830-4907-b0c1-da74603e73ef)



## Descrição
Este projeto foi desenvolvido com o objetivo de criar um sistema de gerenciamento de livros, vendas, estoques e vendedores utilizando MySQL. A estrutura inclui tabelas relacionadas, manipulação de dados, integração entre entidades e execução de consultas para extrair informações relevantes.

---

## Estrutura do Banco de Dados

### Tabelas Criadas

- **LIVROS:** Armazena informações sobre os livros.
  - Campos: `ID_LIVRO`, `NOME_LIVRO`, `AUTORIA`, `EDITORA`, `CATEGORIA`, `PREÇO`.

- **ESTOQUE:** Gerencia a quantidade de exemplares dos livros.
  - Campos: `ID_LIVRO`, `QTD_ESTOQUE`.

- **VENDEDORES:** Contém dados sobre os vendedores.
  - Campos: `ID_VENDEDOR`, `NOME_VENDEDOR`.

- **VENDAS:** Registra as vendas realizadas.
  - Campos: `ID_PEDIDO`, `ID_VENDEDOR`, `ID_LIVRO`, `QTD_VENDIDA`, `DATA_VENDA`.

### Restrições e Chaves
- **Chaves Primárias:** Definidas para cada tabela para garantir unicidade.
- **Chaves Estrangeiras:**
  - `CE_ESTOQUE_LIVROS`: Relaciona a tabela `ESTOQUE` à tabela `LIVROS`.
  - Integridade referencial com `ON DELETE NO ACTION` e `ON UPDATE NO ACTION`.

---

## Manipulação de Dados

### Inserções
Inserção de dados iniciais nas tabelas `LIVROS`, `VENDEDORES`, `VENDAS` e `ESTOQUE`. Exemplos:

```sql
INSERT INTO LIVROS VALUES
(1, "Percy Jackson e o Ladrao de Raios", "Rick Riordan", "Intrinseca", "Aventura", 34.65);

INSERT INTO VENDEDORES VALUES (1, 'Paula Rabelo');

INSERT INTO VENDAS VALUES (1, 3, 7, 1, '2020-11-02');
```

### Atualizações
Ajuste de preços dos livros com base em desconto:

```sql
UPDATE LIVROS SET PREÇO = 0.9 * PREÇO;
```

### Exclusões
Exclusão de registros específicos:

```sql
DELETE FROM LIVROS WHERE ID_LIVRO = 8;
```

---

## Consultas Realizadas

### Consulta Simples
Exemplo de seleção de livros por categoria:

```sql
SELECT * FROM LIVROS WHERE CATEGORIA = "POESIA" AND NOT (AUTORIA = "Luís Vaz de Camões" OR AUTORIA = "Gabriel Pedrosa");
```

### Consultas com Agregação
Exemplo de soma das vendas por vendedor:

```sql
SELECT VENDAS.ID_VENDEDOR, VENDEDORES.NOME_VENDEDOR, SUM(VENDAS.QTD_VENDIDA)
FROM VENDAS INNER JOIN VENDEDORES
ON VENDAS.ID_VENDEDOR = VENDEDORES.ID_VENDEDOR
GROUP BY VENDAS.ID_VENDEDOR;
```

### Consultas Complexas
Verificação de livros sem vendas registradas:

```sql
SELECT LIVROS.NOME_LIVRO, VENDAS.QTD_VENDIDA
FROM LIVROS LEFT JOIN VENDAS
ON LIVROS.ID_LIVRO = VENDAS.ID_LIVRO
WHERE VENDAS.QTD_VENDIDA IS NULL;
```

### Agregação e Ordenação
Consulta para identificar a maior venda:

```sql
SELECT MAX(QTD_VENDIDA) FROM VENDAS;
```

---

## Funcionalidades Importantes
- **Integração entre Tabelas:** Uso de `JOIN` para consolidar dados.
- **Análises Estatísticas:** Funções de agregação como `SUM` e `MAX`.
- **Segurança dos Dados:** Definição de restrições para manutenção da integridade referencial.

---

## Conclusão
Este projeto demonstra boas práticas na criação e manipulação de banco de dados relacional utilizando MySQL, abordando aspectos como modelagem, consultas complexas, atualizações e integração de tabelas para uma aplicação de gestão de livros e vendas.

