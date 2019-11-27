# Como instalar Ruby on Rails no Linux Mint (cinnamon)

  Ruby on Rails (RoR) é uma estrutura de aplicativo de código aberto, públicada
  sob a licença MIT. É uma estrutura de aplicativo WEB do lado do servidor que segue 
  o conceito de MVC (Model-View-Controller).

  O Rails fornece estrutura padrão para o banco de dados, páginas e serviços da web.
  Mais de 3000 desenvolvedores contribuiram com o código para a estrutura do Rails e 
  existem muitos aplicativos conhecidos baseados no Raisl, como Github, Airbnb,
  Soundcloud etc.

  Este tutorial irá mostrar as etapas para instalar o Ruby on Rails no linux mint
  (distribuiçoes debian). Irá mostar como instalar e configurar o Rails com um banco de dados
  PostgreSQL e como criar um primerio projeto com o Rails.

# Instalar o RVM (Ruby Version Manager)

  O RVM (Ruby Version Manager) é uma ferramenta de linha de comando baseada no 
  Bash (Bourne-Again SHell) e Ruby para gerenciar a instalação do ruby. O RVM 
  permite instalar e configurar várias versões do ruby em um sistema.
  
  O primeiro passo que a fazer é instalar os pacotes RVM usando os scripts.

  Adicione a chave rvm ao servidor.

    $ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \7D2BAF1CF37B13E2069D6956105BD0E739499BDB

  Instale a versão estável do rvm executando o comando abaixo.

    $ curl -sSL https://get.rvm.io | bash -s stable --ruby

  O comando instala automaticamente os pacotes necessários e a versão mais recente 
  do rvm estável.
  
  Após a conclusão da instalação, execute o comando.

    $ source /usr/local/rvm/scripts/rvm

  Agora você pode usar o comando rvm para gerenciar a versão ruby.

    $ rvm version ( Versão )

# Configurar a versão mais recente do Ruby.

  A versão mais recente do ruby será automaticamente instalada durante 
  a instalação do rvm, quando não houver pacote ruby no sistema.

  Nesta etapa, configuraremos a versão ruby padrão no sistema linux Mint.

  Atualize o rvm para a versão estável mais recente.

    $ rvm get stable --autolibs=enable
    $ usermod -a -G rvm root

  Agora verifique todas as versões ruby disponíveis.

    $ rvm list known

  E você obterá muitas versões disponíveis do ruby - instale a versão 
  estável mais recente do Ruby usando o comando rvm, como mostrado abaixo.

    $ rvm install ruby

  Depois que toda a instalação estiver concluída, faça a versão atual padrão
  no sistema linux mint.  

    $ rvm --default use ruby-( versão mais recente )

  Conferir a versão do ruby.

    $ ruby -v


# Instalar o NodeJS

  O Ruby on Rails requer o tempo de execução JavaScript para compilar 
  o pipeline de ativos do Rails. E para o desenvolvimento do Rails no 
  Linux, é melhor instalar e usar o Nodejs como o tempo de execução 
  Javascript.

  Inclua o repositório nodejs nodesource no sistema.

    $ curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

  Instale a versão mais recente nodejs  e alguns pacotes adicionais 
  usando o comando apt abaixo.

    $ sudo apt install -y nodejs
    $ sudo apt install gcc g++ make

# Configurar Ruby Gem

  RubyGems é um Ruby Package Manager, fornecido com a ferramenta de linha de
  comando gem. Ele é instalado automaticamente quanto instalamos o Ruby no 
  sistema. 

  Aualize a gem para a versão mais recente e verifque-a.

    $ gem update --system
    $ gem -v

  Nota:
  Isso é opcional, podemos desativar a gem para instalar a documentação em todas
  as instalações de pacotes ruby. Simplesmente dicionar a configuração ao
  arquivo de configuração '.gemrc'.

    $ echo "gem: --no-document" >> ~/.gemrc


# Instalar o Ruby on Rails

  Neste tutorial, usaremos a versão mais recente estável, vamos instalar o Rails
  usando o gerenciador de pacotes gem ruby.

  Instale o Ruby on Rails usando o comando abaixo.

    $ gem install rails -v ( versão mais recente )

  Após instalação verifique com o comando:

    $ rails -v


# Configurar o banco de dados PostgreSQL para desenvolvimento de Rails

  Por padrão, o Ruby on Rails está usando o banco de dados SQLite. Ele suporta 
  muitos sistemas de bancos de dados, incluindo MYSQL, SQLite e PostgresSQL. E
  para este guia, usaremos o PostgresSQL.

  Instale o banco de dados PostgreSQL usando o comando apt abaixo como
  adminstador do sistema.

    $ sudo apt install postgresql postgresql-contrib libpq-dev -y
  
  Após a conclusão de toda instalação, inicie o serviço Postgres e ative todas 
  as vezes na inicialização do sistema.

    $ systemctl start postgresql
    $ systemctl enable postgresql

  Em seguida, configuraremos uma senha para o usuário do Postgres e criaremos um 
  novo usuário para instalação do Rails.

  Entre no usuário do 'postgres' e execute o shell do Postgres.

    $ su - postgres
    $ psql

  Mude a senha do Postgres usando o comando abaixo.

    $ \password postgres

  Digite sua senha e a senha do usuário do postgres.

  Agora vamos criar uma nova role para nossa instalação de rails. Criaremos
  uma nova role chamada 'rails_dev' com o privilégio de criar o banco de dados e com a senha 'aqwe123'.

  Execute a consulta do postgres abaixo.

    $ create role rails_dev with createdb login password 'aqwe123';

  Agora verifique todas as roles disponíveis no sistema.

    $ \du

  A instalação e configuração do PostgreSQL para o Desenvolvimento Rails foi concluída.

# Crie seu primeiro aplicativo com Rails e PostgreSQL

  O Ruby on Rails fornece um 'rails' de linha de comando para inicializar nosso 
  primeiro aplicativo de rails.

  Crie um novo projeto 'barufis_blog' com o banco de dados padrão 'PostgreSQL' 
  executando o comando rails abaixo.

    $ rails new barufis_blog -d postgresql

  Agora você verá o diretório 'barufis_blog', vá para esse diretório e edite o 
  o arquivo de configuração do banco de dados 'database.yml' usando o editor de sua
  preferencia (eu utilizo o visual studio code).

    $ cd barufis_blog
    $ code .

  Utilizando o VS Code vá em config/database.yml e configure o arquivo comforme 
  abaixo:

    username: rails_dev
    password: aqwe123
    host: localhost
    port 5423

  Para a seção de teste, cole essas configurações abaixo.     

    host: localhost
    port: 5432
    username: rails_dev
    password: aqwe123

  Salvar e sair.

  Agora gere o banco de dados e verifique se não há erro.

    $ rails db:setup
    $ rails db:migrate

  Quando toda a instalação estiver concluida, inicie o servidor web puma rails padrão
  com o comando abaixo.

    $ rails s

  O primeiro projeto de rails será executado no localhost na porta 8080

    http://localhost:8080

  Abra o navegador web e digite o endereço de acima.

  Se tudo foi instalado e configurado corretamente você vera a pagina inicial
  do projeto Rails.

  Em seguida, testaremos a criação de um CRUD simples com o banco de dados
  PostgreSQL.

  Execute o comando rails abaixo:

    $ rails g scaffold Post title:string body:text
    $ rake db:migrate

  Execute o servidor da web novamente.

    $ rails s

  Abra o navegador da web com a URL abaixo.

    http://localhost:8080/posts