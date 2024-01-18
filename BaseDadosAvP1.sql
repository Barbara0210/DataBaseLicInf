CREATE TABLE Utilizadores (id_utilizador SERIAL NOT NULL, email varchar(255) NOT NULL, password varchar(255) NOT NULL, idade int4 NOT NULL, telemovel int4 NOT NULL, TipoUtilizadorid_tipo_utilizador int4 NOT NULL, PlanosPremiumid_plano int4, PRIMARY KEY (id_utilizador));
CREATE TABLE Livros (id_livro SERIAL NOT NULL, titulo varchar(255) NOT NULL, foto varchar(255) NOT NULL, descricao int4 NOT NULL, faixa_etaria varchar(255) NOT NULL, estado varchar(255) NOT NULL, tipo_acesso varchar(255) NOT NULL, pag_audio varchar(255) NOT NULL, pag_video varchar(255) NOT NULL, rating float4 NOT NULL, PRIMARY KEY (id_livro));
CREATE TABLE TipoUtilizador (id_tipo_utilizador SERIAL NOT NULL, tipo_utilizador int4 NOT NULL, descrição int4 NOT NULL, PRIMARY KEY (id_tipo_utilizador));
CREATE TABLE Autores (id_autor SERIAL NOT NULL, nome varchar(255) NOT NULL, foto varchar(255) NOT NULL, descricao varchar(255) NOT NULL, Nacionalidadeid_nacionalidade int4 NOT NULL, PRIMARY KEY (id_autor));
CREATE TABLE Utilizadores_Livros (Utilizadoresid_utilizador int4 NOT NULL, Livrosid_livro int4 NOT NULL, progresso_livro int4 NOT NULL, data date NOT NULL, favorito int4 NOT NULL, PRIMARY KEY (Utilizadoresid_utilizador, Livrosid_livro));
CREATE TABLE Livros_Autores (Livrosid_livro int4 NOT NULL, Autoresid_autor int4 NOT NULL, PRIMARY KEY (Livrosid_livro, Autoresid_autor));
CREATE TABLE AtividadesExploracao (id_atividade SERIAL NOT NULL, descricao varchar(255) NOT NULL, data_inicio date NOT NULL, Progresso_atividade int4 NOT NULL, Utilizadores_LivrosUtilizadoresid_utilizador int4 NOT NULL, Utilizadores_LivrosLivrosid_livro int4 NOT NULL, PRIMARY KEY (id_atividade));
CREATE TABLE Avaliacoes (id_avaliacao SERIAL NOT NULL, classificacao float4 NOT NULL, comentario varchar(255) NOT NULL, Utilizadoresid_utilizador int4 NOT NULL, Livrosid_livro int4, PRIMARY KEY (id_avaliacao));
CREATE TABLE PlanosPremium (id_plano SERIAL NOT NULL, nome varchar(255) NOT NULL, descricao varchar(255) NOT NULL, preco float4 NOT NULL, VoucherDescontoid_voucher int4, PRIMARY KEY (id_plano));
CREATE TABLE VoucherDesconto (id_voucher SERIAL NOT NULL, codigo_voucher varchar(255) NOT NULL, valor_desconto float4 NOT NULL, validade date NOT NULL, PRIMARY KEY (id_voucher));
CREATE TABLE Tags (id_tag SERIAL NOT NULL, nome varchar(255) NOT NULL, descricao varchar(255) NOT NULL, PRIMARY KEY (id_tag));
CREATE TABLE Livros_Tags (Livrosid_livro int4 NOT NULL, Tagsid_tag int4 NOT NULL, PRIMARY KEY (Livrosid_livro, Tagsid_tag));
CREATE TABLE Paginas_Texto (id SERIAL NOT NULL, numero_paginas int4 NOT NULL, conteudo varchar(255) NOT NULL, Livrosid_livro int4, PRIMARY KEY (id));
CREATE TABLE Nacionalidade (id_nacionalidade SERIAL NOT NULL, nome varchar(255) NOT NULL, Autoresid_autor int4 NOT NULL, PRIMARY KEY (id_nacionalidade));
ALTER TABLE Utilizadores ADD CONSTRAINT FKUtilizador392775 FOREIGN KEY (TipoUtilizadorid_tipo_utilizador) REFERENCES TipoUtilizador (id_tipo_utilizador);
ALTER TABLE Utilizadores_Livros ADD CONSTRAINT FKUtilizador199881 FOREIGN KEY (Utilizadoresid_utilizador) REFERENCES Utilizadores (id_utilizador);
ALTER TABLE Utilizadores_Livros ADD CONSTRAINT FKUtilizador751232 FOREIGN KEY (Livrosid_livro) REFERENCES Livros (id_livro);
ALTER TABLE Livros_Autores ADD CONSTRAINT FKLivros_Aut251572 FOREIGN KEY (Livrosid_livro) REFERENCES Livros (id_livro);
ALTER TABLE Livros_Autores ADD CONSTRAINT FKLivros_Aut272205 FOREIGN KEY (Autoresid_autor) REFERENCES Autores (id_autor);
ALTER TABLE PlanosPremium ADD CONSTRAINT FKPlanosPrem483682 FOREIGN KEY (VoucherDescontoid_voucher) REFERENCES VoucherDesconto (id_voucher);
ALTER TABLE Utilizadores ADD CONSTRAINT FKUtilizador639256 FOREIGN KEY (PlanosPremiumid_plano) REFERENCES PlanosPremium (id_plano);
ALTER TABLE Avaliacoes ADD CONSTRAINT FKAvaliacoes565364 FOREIGN KEY (Utilizadoresid_utilizador) REFERENCES Utilizadores (id_utilizador);
ALTER TABLE Avaliacoes ADD CONSTRAINT FKAvaliacoes585841 FOREIGN KEY (Livrosid_livro) REFERENCES Livros (id_livro);
ALTER TABLE Livros_Tags ADD CONSTRAINT FKLivros_Tag162817 FOREIGN KEY (Livrosid_livro) REFERENCES Livros (id_livro);
ALTER TABLE Livros_Tags ADD CONSTRAINT FKLivros_Tag805992 FOREIGN KEY (Tagsid_tag) REFERENCES Tags (id_tag);
ALTER TABLE Paginas_Texto ADD CONSTRAINT FKPaginas_Te604975 FOREIGN KEY (Livrosid_livro) REFERENCES Livros (id_livro);
ALTER TABLE Autores ADD CONSTRAINT FKAutores428252 FOREIGN KEY (Nacionalidadeid_nacionalidade) REFERENCES Nacionalidade (id_nacionalidade);
ALTER TABLE AtividadesExploracao ADD CONSTRAINT FKAtividades639097 FOREIGN KEY (Utilizadores_LivrosUtilizadoresid_utilizador, Utilizadores_LivrosLivrosid_livro) REFERENCES Utilizadores_Livros (Utilizadoresid_utilizador, Livrosid_livro);

INSERT INTO nacionalidade (id_nacionalidade,nome) VALUES ('1','Portugues');
INSERT INTO nacionalidade (id_nacionalidade,nome) VALUES ('2','Italiano');
INSERT INTO nacionalidade (id_nacionalidade,nome) VALUES ('2','Ucraniano');

INSERT INTO tags (id_tag,nome,descricao) VALUES ('1','Fantasia','livros fantasia');
INSERT INTO tags (id_tag,nome,descricao) VALUES ('2','Terror','livros terror');
INSERT INTO tags (id_tag,nome,descricao) VALUES ('3','Infantil','livros infantis');

INSERT INTO tipoutilizador (id_tipo_utilizador,tipo_utilizador,descricao) VALUES ('1','1','1');
INSERT INTO tipoutilizador (id_tipo_utilizador,tipo_utilizador,descricao) VALUES ('2','2','2');
INSERT INTO tipoutilizador (id_tipo_utilizador,tipo_utilizador,descricao) VALUES ('3','3','3');

insert into livros (id_livro,titulo,foto,descricao,faixa_etaria,estado,tipo_acesso,pag_audio,pag_video)
values ('2','titulo2','foto2','22','5-12','disponivel','normal','urlAudio','urlVideo');

insert into livros (id_livro,titulo,foto,descricao,faixa_etaria,estado,tipo_acesso,pag_audio,pag_video)
values ('3','titulo3','foto3','22','10-20','indisponivel','premium','urlAudio','urlVideo');

insert into voucherdesconto (id_voucher,codigo_voucher,valor_desconto,validade) values ('1','AAAAA','2','22/12/2024');
insert into voucherdesconto (id_voucher,codigo_voucher,valor_desconto,validade) values ('2','BBBBB','5.5','22/12/2024');
insert into voucherdesconto (id_voucher,codigo_voucher,valor_desconto,validade) values ('3','CCCCC','3','22/12/2024');

insert into planospremium (id_plano,nome,descricao,preco,voucherdescontoid_voucher) values ('2','premium2','acesso premium','10','1');
insert into planospremium (id_plano,nome,descricao,preco,voucherdescontoid_voucher) values ('3','premium3','acesso premium','15','3');

insert into paginas_texto (id,numero_paginas,conteudo,livrosid_livro) values ('1','111','url','1');
insert into paginas_texto (id,numero_paginas,conteudo,livrosid_livro) values ('2','222','url','2');
insert into paginas_texto (id,numero_paginas,conteudo,livrosid_livro) values ('3','333','url','3');

insert into autores (id_autor,nome,foto,descricao,nacionalidadeid_nacionalidade) values ('1','nome1','foto1','descricao1',1);
insert into autores (id_autor,nome,foto,descricao,nacionalidadeid_nacionalidade) values ('2','nome2','foto2','descricao2',2);
insert into autores (id_autor,nome,foto,descricao,nacionalidadeid_nacionalidade) values ('3','nome3','foto3','descricao3',1);

insert into avaliacoes (id_avaliacao,classificacao,comentario,utilizadoresid_utilizador,livrosid_livro) values ('1','3','comentario1','1','1');
insert into avaliacoes (id_avaliacao,classificacao,comentario,utilizadoresid_utilizador,livrosid_livro) values ('2','4','comentario2','1','2');
insert into avaliacoes (id_avaliacao,classificacao,comentario,utilizadoresid_utilizador,livrosid_livro) values ('3','2','comentario3','1','3');

insert into utilizadores (id_utilizador,email,password,idade,telemovel,tipoutilizadorid_tipo_utilizador,planospremiumid_plano)
values ('2','utilizador1@gmail.com','pass','15','999999999','1','1');
insert into utilizadores (id_utilizador,email,password,idade,telemovel,tipoutilizadorid_tipo_utilizador,planospremiumid_plano)
values ('3','utilizador3@gmail.com','pass','18','999999999','2','3');
	
insert into livros_tags (livrosid_livro,tagsid_tag) values ('1','1');
insert into livros_tags (livrosid_livro,tagsid_tag) values ('2','1');
insert into livros_tags (livrosid_livro,tagsid_tag) values ('3','2');

insert into livros_autores (livrosid_livro,autoresid_autor) values ('1','1');
insert into livros_autores (livrosid_livro,autoresid_autor) values ('2','1');
insert into livros_autores (livrosid_livro,autoresid_autor) values ('3','2');

insert into utilizadores_livros(utilizadoresid_utilizador,	livrosid_livro,progresso_livro,data,favorito)
values ('1','1','55','15/11/2023','1');
insert into utilizadores_livros(utilizadoresid_utilizador,	livrosid_livro,progresso_livro,data,favorito)
values ('2','1','75','15/11/2023','0');
insert into utilizadores_livros(utilizadoresid_utilizador,	livrosid_livro,progresso_livro,data,favorito)
values ('3','2','35','15/11/2023','1');

insert into atividadesexploracao (id_atividade,descricao,data_inicio,progresso_atividade,utilizadores_livrosutilizadoresid_utilizador,utilizadores_livroslivrosid_livro)
values ('1','atividade1','14/11/2023','35','1','1')
insert into atividadesexploracao (id_atividade,descricao,data_inicio,progresso_atividade,utilizadores_livrosutilizadoresid_utilizador,utilizadores_livroslivrosid_livro)
values ('2','atividade2','14/11/2023','22','2','1');
insert into atividadesexploracao (id_atividade,descricao,data_inicio,progresso_atividade,utilizadores_livrosutilizadoresid_utilizador,utilizadores_livroslivrosid_livro)
values ('3','atividade3','14/11/2023','15','3','2');

CREATE OR REPLACE FUNCTION atualizar_rating_livro()
RETURNS TRIGGER AS $$
DECLARE
    total_avaliacoes INT;
    soma_classificacoes FLOAT;
    novo_rating FLOAT;
BEGIN
    -- Contar o número total de avaliações para o livro
    SELECT COUNT(*) INTO total_avaliacoes
    FROM Avaliacoes
    WHERE Livrosid_livro = NEW.Livrosid_livro;

    -- Calcular a soma das classificações para o livro
    SELECT COALESCE(SUM(classificacao), 0) INTO soma_classificacoes
    FROM Avaliacoes
    WHERE Livrosid_livro = NEW.Livrosid_livro;

    -- Calcular o novo rating
    IF total_avaliacoes > 0 THEN
        novo_rating := soma_classificacoes / total_avaliacoes;
    ELSE
        novo_rating := 0;
    END IF;

    -- Atualizar o rating na tabela Livros
    UPDATE Livros
    SET rating = novo_rating
    WHERE id_livro = NEW.Livrosid_livro;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criar o trigger
CREATE TRIGGER after_insert_avaliacao
AFTER INSERT ON Avaliacoes
FOR EACH ROW
EXECUTE FUNCTION atualizar_rating_livro();
