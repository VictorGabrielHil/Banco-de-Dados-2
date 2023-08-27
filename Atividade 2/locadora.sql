create table cliente(
	idcliente int auto_increment not null primary key,
    cpf varchar(11) not null,
    nome varchar(50),
    endereco varchar(100),
    cnh varchar(10)
);
select * from cliente;
insert into cliente (cpf, nome, endereco, cnh) 
values ("04731199948", "Leonardo Eugênio Panceri de Araujo", "Rua Arcione Cantador 638, Fazenda Velha, Araucária-PR", "1234567890");

create table veiculo(
	placa varchar(7) not null primary key,
    marca varchar(10),
    modelo varchar(10),
    ano int,
    categoria varchar(10),
    quilometragem int,
    estado varchar(10)
);

insert into veiculo values ("BRA2E19", "Chevrolet", "Onix", 2023, "popular", 1200, "disponivel"), ("BRC3F99", "Fiat", "Argo", 2022, 'popular', 3890, "disponivel");
select * from veiculo;

create table locacao(
	idlocacao int not null auto_increment primary key,
    idcliente int not null,
    placaveiculo varchar(7) not null,
    dt_ini_loc date,
    dt_fim_loc date,
    vlr_loc float,
    foreign key (idcliente) references cliente(idcliente),
    foreign key (placaveiculo) references veiculo (placa)
);

insert into locacao (idcliente, placaveiculo, dt_ini_loc, dt_fim_loc, vlr_loc)
values (1, "BRA2E19", '2023-08-28', '2023-09-01', 350.00);
update veiculo set estado = 'locado' where placa = 'BRA2E19';

/*Mostra os clientes com locação e o veículo locado"*/

select l.idcliente, c.nome, l.placaveiculo, v.modelo from locacao l 
inner join cliente c on (l.idcliente = c.idcliente) inner join veiculo v on(l.placaveiculo = v.placa);
