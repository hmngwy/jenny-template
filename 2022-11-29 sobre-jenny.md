# Sobre como usar o gerador de sites jenny

Meu fluxo de posts antes de conhecer o framework [jenny](https://github.com/hmngwy/jenny):

  1. clonar o repo com meus posts em markdown
  2. adicionar novo post
  3. instalar o hugo(renderiza markdown para html)
  4. renderizo nova versão do meu github pages(em outro repo)
  5. publico o conteúdo do repo com os htmls gerados no passo 4

Meu novo fluxo usando **jenny**:

  1. clonar o repo com meus posts em markdown
  2. adicionar novo post
  3. `git push`

ZERO configurações locais, mas como isso funciona?

Esse framework tem uma **action** publicada no market do github, ok eu sei, deve ter uma para hugo também. Mas confesso que só caiu a ficha que poderia usar dessa forma através do **jenny**.

Esta action, faz uso de um container com todas as dependências necessárias para que os meus arquivos markdown sejam renderizados para html, o restante é a magia do github pages.

Basta que o nome do repo seja <seu-usuário-github>.github.io e que você tenha um branch com o nome gh-pages e voilà!

## cutomizando templates

Na documentação do projeto está tudo bem descrito, com a exceção de uma coisa.

**Não esqueça de alterar as permisões dos arquivos da pasta .layout** eu apliquei um chmod 775 e tudo funcionou lindamente.

**Se quiser que os posts obedeçam a ordem da data definida no nome do arquivo YYYY-MM-DD, remova isso do template:**

    $(date -d "$POST_DATE_RFC822" +%m/%d/%Y)
    # e passe a usar apenas
    $POST_DATE

tags: portuguese
