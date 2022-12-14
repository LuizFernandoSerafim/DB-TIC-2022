create table tb_administradores(
username varchar(60),
senha varchar(10),
constraint pk_tb_administradores_username Primary Key(username)
);
create table tb_clientes(
cpf varchar(11),
senha varchar(10),
cep varchar(10),
sexo bool,
email varchar(40),
estado varchar(2),
cidade varchar(40),
telefone varchar(17),
emprego varchar(40),
nome varchar(60),
data_nascimento date,
endereco varchar(160),
constraint pk_tb_clientes_cpf primary key (cpf)
);
create table tb_promocao(
idPromocao integer,
dt_inicio date,
dt_fim date,
valor integer,
constraint pk_tb_promocao_id primary key (idPromocao)
);
create table tb_editar(
idPromocao integer,
username varchar(60),
constraint pk_tb_clientes_idPromocao_username primary key (idPromocao,username),
constraint fk_tb_clientes_idPromocao foreign key (idPromocao)
references tb_promocao (idPromocao),
constraint fk_tb_clientes_username foreign key (username)
references tb_administradores (username)
);
create table tb_visualizar(
idPromocao integer,
cpf varchar(60),
constraint pk_tb_visualizar_id_cpf primary key (idPromocao,cpf),
constraint fk_tb_visualiza_id foreign key (idPromocao)
references tb_promocao (idPromocao),
constraint fk_tb_visualiza_cpf foreign key (cpf)
references tb_clientes (cpf)
);
create table tb_brinde_cupom(
idBrindeCupom integer,
qtdpont integer,
constraint pk_tb_brinde_cupom_id primary key (idBrindeCupom)
);
create table tb_cria_edita(
username varchar(60),
idCriaEdita integer,
constraint pk_tb_cria_edita_username_id primary key (username, idCriaEdita),
constraint fk_tb_cria_edita_username foreign key (username)
references tb_administradores (username),
constraint fk_tb_cria_edita_idCriaEdita foreign key (idCriaEdita)
references tb_brinde_cupom (idBrindeCupom)
);
create table tb_troca(
cpf varchar(11),
idTroca integer,
constraint pk_tb_troca_cpf_id primary key (cpf, idTroca),
 
constraint fk_tb_troca_cpf foreign key (cpf)
references tb_clientes (cpf),
constraint fk_tb_troca_id foreign key (idTroca)
references tb_brinde_cupom (idBrindeCupom)
);
create table tb_pontos(
cpf varchar(11),
quantidadept integer,
constraint pk_tb_pontos_cpf_quantidadept primary key (cpf, quantidadept),
constraint fk_tb_pontos_cpf foreign key (cpf)
references tb_clientes (cpf));
create table tb_sorteio(
idSorteio integer,
nome_sorteio varchar(40),
constraint pk_tb_sorteio_id primary key (idSorteio)
);
create table tb_gerencia(
username varchar(60),
idSorteio integer,
constraint pk_tb_gerencia_username_id primary key (username, idSorteio),
constraint fk_tb_gerencia_username foreign key (username)
references tb_administradores (username),
constraint fk_tb_gerencia_id foreign key (idSorteio)
references tb_sorteio (idSorteio)
);
create table tb_cupom(
idCupom integer,
cpf varchar(11),
constraint pk_tb_cupom_id primary key (idCupom),
constraint fk_tb_cupom_cpf foreign key (cpf)
references tb_clientes (cpf)
);
create table tb_concorre(
idCupom integer,
idSorteio integer,
constraint pk_tb_concorre_idCupom_idSorteio primary key (idCupom, idSorteio),
constraint fk_tb_concorre_idCupom foreign key (idCupom)
references tb_cupom (idCupom),
constraint fk_tb_concorre_idsorteio foreign key (idSorteio)
);

