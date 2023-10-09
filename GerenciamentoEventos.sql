CREATE DATABASE GerenciamentoEven;

USE GerenciamentoEven;

DROP DATABASE GerenciamentoEven;

CREATE TABLE Eventos(
EventoId INT PRIMARY KEY AUTO_INCREMENT,
NomeEvento VARCHAR(45) NOT NULL,
DataEvento DATE NOT NULL,
Localizacao VARCHAR(255) NOT NULL
);

INSERT INTO Eventos (NomeEvento, DataEvento, Localizacao) VALUES ('Trapzada', '2023-10-06', 'Wet Wild');
INSERT INTO Eventos (NomeEvento, DataEvento, Localizacao) VALUES ('Romance a Moda', '2023-09-10', 'Paralela Park');
INSERT INTO Eventos (NomeEvento, DataEvento, Localizacao) VALUES ('Modão', '2023-08-15', 'Wet Wild');
INSERT INTO Eventos (NomeEvento, DataEvento, Localizacao) VALUES ('Ravena', '2023-07-20', 'Wet Wind');
INSERT INTO Eventos (NomeEvento, DataEvento, Localizacao) VALUES ('Festival de Verão', '2023-06-25', 'Wet Wild');

DROP TABLE Eventos;

CREATE TABLE Participantes(
ParticipanteId INT PRIMARY KEY AUTO_INCREMENT,
NomeParticipante VARCHAR(255) NOT NULL,
Email VARCHAR(255) NOT NULL, 
Telefone VARCHAR(25) NOT NULL,
IdEvento INT,
FOREIGN KEY (IdEvento) REFERENCES Eventos(EventoId)
);

INSERT INTO Participantes (NomeParticipante, Email, Telefone, IdEvento) VALUES ('Thalita', 'thalita@gmail.com', '(71) 9 8501-3844', 1);
INSERT INTO Participantes (NomeParticipante, Email, Telefone, IdEvento) VALUES ('Maria', 'maria@gmail.com', '(71) 9 8775-8626', 2);
INSERT INTO Participantes (NomeParticipante, Email, Telefone, IdEvento) VALUES ('João', 'joao@gmail.com', '(71) 9 8889-5734', 3);
INSERT INTO Participantes (NomeParticipante, Email, Telefone, IdEvento) VALUES ('Pedro', 'pedro@gmail.com', '(71) 9 8718-3933', 4);
INSERT INTO Participantes (NomeParticipante, Email, Telefone, IdEvento) VALUES ('Júlia', 'julia@gmail.com', '(71) 9 8503-6978', 5);

DROP TABLE Participantes;

CREATE TABLE Inscricoes(
InscricoesId INT PRIMARY KEY,
IdEvento INT NOT NULL,
FOREIGN KEY (IdEvento) REFERENCES Eventos(EventoId),
IdParticipante INT NOT NULL,
FOREIGN KEY (IdParticipante) REFERENCES Participantes (ParticipanteId)
);

INSERT INTO Inscricoes (InscricoesId, IdEvento, IdParticipante) VALUES (2, 1, 1);
INSERT INTO Inscricoes (InscricoesId, IdEvento, IdParticipante) VALUES (3, 2, 2);
INSERT INTO Inscricoes (InscricoesId, IdEvento, IdParticipante) VALUES (4, 3, 3);
INSERT INTO Inscricoes (InscricoesId, IdEvento, IdParticipante) VALUES (5, 4, 4);
INSERT INTO Inscricoes (InscricoesId, IdEvento, IdParticipante) VALUES (6, 5, 5);

DROP TABLE Inscricoes;

SELECT E.nomeevento AS 'Nome Eventos',
P.nomeparticipante AS 'Nome Participantes'
FROM Eventos E
INNER JOIN Inscricoes I ON E.eventoid = I.idevento
INNER JOIN Participantes P ON I.idparticipante= P.participanteid;


SELECT*FROM Eventos;
SELECT*FROM Participantes;
SELECT*FROM Inscricoes;