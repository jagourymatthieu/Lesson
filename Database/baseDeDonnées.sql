create table Employe(
	n_Emp int primary key,
	nom varchar(32) not null,
	prenom varchar(32),
	dateN date,
	pays varchar(32)
);

create table Categorie(
	n_Cat int primary key,
	nom varchar(32) not null,
	description varchar(255)
);

create table Fournisseur(
	n_Fou int primary key,
	societe varchar(255),
	contact varchar(255),
	fonction varchar(255),
	ville varchar(50),
	pays varchar(50)
);

create table Produit(
	n_Pr int primary key,
	nom varchar(20) not null,
	n_Fou int references Fournisseur(n_Fou),
	n_Cat int references Categorie(n_Cat)
	prix decimal(6,2),
	stock int check(stock >0),
	indisp int check(indisp in(0,1))
);

create table Client(
	n_Cl varchar(50) primary key,
	societe varchar(255),
	contact varchar(255),
	fonction varchar(255),
	ville varchar(50),
	pays varchar(50)
);

create table Commande(
	n_Com int primary key,
	n_Cl varchar(50) references Client(n_Cl),
	n_Emp int references Employe(n_Emp),
	dateC date,
	dateLiv date,
	dateEnv date,
	ville varchar(50)
);

create table DetailsCommande(
	n_Com int references Commande(n_Com),
	n_Pr int references Produit(n_Pr),
	quantite int default 0,
	remise decimal(5,2),
	primary key (n_Com, n_Pr)
);

begin
insert into Employe values
(1, 'Leblanc', 'Marie', TO_DATE('08/12/1948', 'dd/mm/yyyy'), 'France');
insert into Employe values
(2, 'Brachman', 'Andrew', TO_DATE('19/02/1952', 'dd/mm/yyyy'), 'France');
insert into Employe values
(3, 'Leclerc', 'Janet', TO_DATE('30/08/1963', 'dd/mm/yyyy'), 'France');
insert into Employe values
(4, 'Durant', 'Margaret', TO_DATE('19/09/1937', 'dd/mm/yyyy'), 'France');
insert into Employe values
(5, 'Dupont', 'Steven', TO_DATE('04/03/1955', 'dd/mm/yyyy'), 'Royaume-Uni');
insert into Employe values
(6, 'Delahaye', 'Michael', TO_DATE('02/07/1963', 'dd/mm/yyyy'), 'Royaume-Uni');
insert into Employe values
(7, 'King', 'Robert', TO_DATE('29/05/1960', 'dd/mm/yyyy'), 'Royaume-Uni');
insert into Employe values
(8, 'Callahan', 'Laura', TO_DATE('09/01/1958', 'dd/mm/yyyy'), 'Etats-Unis');
insert into Employe values
(9, 'Dodsworth', 'Anne', TO_DATE('27/01/1966', 'dd/mm/yyyy'), 'Royaume-Uni');
end

begin 
insert into Categorie values (1, 'Boissons', 'Boissons, cafés, thés, bières');
insert into Categorie values (2, 'Condiments', 'Sauces, assaisonnements et épices');
insert into Categorie values (3, 'Desserts', 'Desserts et friandises');
insert into Categorie values (4, 'Produits laitiers', 'Fromages');
insert into Categorie values (5, 'Pâtes et céréales', 'Pains, biscuits, pâtes et céréales');
insert into Categorie values (6, 'Viandes', 'Viandes préparées');
insert into Categorie values (7, 'Produits secs', 'Fruits secs, raisins, autres');
insert into Categorie values (8, 'Poissons et fruits de mer', 'Poissons, fruits de mer, escargots');
end

begin
insert into Fournisseur values (1, 'Exotic Liquids', 'Charlotte Cooper', 'Assistant export', 'London', 'Royaume-Uni');
insert into Fournisseur values (2, 'New Orleans Cajun Delights', 'Shelley Burke', 'Acheteur', 'New Orleans', 'Etats-Unis');
insert into Fournisseur values (3, 'Grandma Kelly''s Homestead', 'Regina Murphy', 'Représentant(e)', 'Ann Arbor', 'Etats-Unis');
insert into Fournisseur values (7, 'Pavlovla, Ltd.', 'Ian Devling', 'Directeur du marketing', 'Melbourne', 'Australie');
insert into Fournisseur values (8, 'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Représentant(e)', 'Manchester', 'Royaume-Uni');
insert into Fournisseur values (26, 'Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Acheteur', 'Salerno', 'Italie');
insert into Fournisseur values (27, 'Escargots Nouveaux', 'Marie Delamare', 'Chef des ventes', 'Montceau', 'France');
insert into Fournisseur values (28, 'Gai pâturage', 'Eliane Noz', 'Représentant(e)', 'Annecy', 'France');
end

begin
insert into Produit values (1, 'Chai', 1, 1, 13.00, 39, 0);
insert into Produit values (2, 'Chang', 1, 1, 14.48, 17, 0);
insert into Produit values (4, 'Chef Anton''s Cajun Seasoning', 2, 2, 16.77, 53, 0);
insert into Produit values (5, 'Chef Anton''s Gumbo Mix', 2, 2, 16.27, 0, 1);
insert into Produit values (6, 'Grandma''s Boysenberry Spread', 3, 2, 19.00, 120, 0);
insert into Produit values (8, 'Northwoods Cranberry Sauce', 3, 2, 30.49, 6, 0);
insert into Produit values (16, 'Pavlova', 7, 3, 13.25, 29, 0);
insert into Produit values (17, 'Alice Mutton', 7, 6, 29.73, 0, 1);
insert into Produit values (19, 'Teatime Chocolate Biscuits', 8, 3, 12.00, 25, 0);
insert into Produit values (20, 'Sir Rodney''s Marmalade', 8, 3, 7.01, 40, 0);
insert into Produit values (56, 'Gnocchi di nonna Alice', 26, 5, 28.97, 21, 0);
insert into Produit values (58, 'Escargots de Bourgogne', 27, 8, 10.25, 62, 0);
insert into Produit values (59, 'Raclette Courdavault', 28, 4, 41.00, 79, 0);
insert into Produit values (60, 'Camemmbert Pierrot', 28, 4, 25.50, 19, 0);
insert into Produit values (68, 'Scottish Longbreads', 8, 3, 9.50, 6, 0);
end

begin 
insert into Client values ('BLONP', 'Blondel père et fils', 'Frédériques Cileaux' ,'Directeur du marketing', 'Strasbourg', 'France');
insert into Client values ('BONAP', 'Bon app''', 'Laurence Lebihan', 'Propriétaire', 'Marseille', 'France');
insert into Client values ('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Chef comptable', 'Tsawassen', 'Canada');
insert into Client values ('FOLIG', 'Folies gourmandes', 'Martine Rancé', 'Représentant(e)', 'Lille', 'France');
insert into Client values ('GREAL', 'Great Lakes Food Market', 'Howard Snyder', 'Directeur du marketing', 'Eugene', 'Etats-Unis');
insert into Client values ('KOENE', 'Könglich Essen', 'Philip Cramer', 'Assistant(e) de ventes', 'Brandenburg', 'Allemagne');
insert into Client values ('LACOR', 'La corne d''abondance', 'Daniel Tonini', 'Représentant(e)', 'Versailles', 'France');
insert into Client values ('LAMAI', 'La maison d''Asie', 'Annette Roulet', 'Chef des ventes', 'Toulouse', 'France');
insert into Client values ('LONEP', 'Lonesome Pine Restaurant', 'Fran Wilson', 'Chef des ventes', 'Portland', 'Etats-Unis');
insert into Client values ('MAGAA', 'Magazzini Alimentari Riunlti', 'Giovanni Rovelli', 'Directeur du marketing', 'Bergamo', 'Italie');
insert into Client values ('PARIS', 'Paris spécialités', 'Marie Bertrand', 'Propriétaire', 'Paris', 'France');
insert into Client values ('SEVES', 'Seven Seas Imports', 'Hari Kumar', 'Chef des ventes', 'London', 'Royaume-Uni');
insert into Client values ('VICTE', 'Victuailles en stock', 'Mary Saveley', 'Assistant(e) des ventes', 'Lyon', 'France');
insert into Client values ('VINET', 'vins et alcools Chevalier', 'Paul Henriot', 'Chef comptable', 'Reims', 'France');
end

begin
insert into Commande values (10265, 'BLONP', 2, TO_DATE('22/07/2006', 'dd/mm/yyyy'), TO_DATE('19/08/2006', 'dd/mm/yyyy'), TO_DATE('09/08/2006', 'dd/mm/yyyy'), 'Strasbourg');
insert into Commande values (10334, 'VICTE', 8, TO_DATE('18/10/2006', 'dd/mm/yyyy'), TO_DATE('15/11/2006', 'dd/mm/yyyy'), TO_DATE('25/10/2006', 'dd/mm/yyyy'), 'Lyon');
insert into Commande values (10431, 'BOTTM', 4, TO_DATE('27/01/2007', 'dd/mm/yyyy'), TO_DATE('10/02/2007', 'dd/mm/yyyy'), TO_DATE('04/02/2007', 'dd/mm/yyyy'), 'Tsawassen');
insert into Commande values (10436, 'BLONP', 3, TO_DATE('02/02/2007', 'dd/mm/yyyy'), TO_DATE('02/03/2007', 'dd/mm/yyyy'), TO_DATE('08/02/2007', 'dd/mm/yyyy'), 'Strasbourg');
insert into Commande values (10454, 'LAMAI', 4, TO_DATE('18/02/2007', 'dd/mm/yyyy'), TO_DATE('18/03/2007', 'dd/mm/yyyy'), TO_DATE('22/02/2007', 'dd/mm/yyyy'), 'Toulouse');
insert into Commande values (10457, 'KOENE', 2, TO_DATE('22/02/2007', 'dd/mm/yyyy'), TO_DATE('22/03/2007', 'dd/mm/yyyy'), TO_DATE('28/02/2007', 'dd/mm/yyyy'), 'Bandenburg');
insert into Commande values (10511, 'BONAP', 4, TO_DATE('15/04/2007', 'dd/mm/yyyy'), TO_DATE('13/05/2007', 'dd/mm/yyyy'), TO_DATE('18/04/2007', 'dd/mm/yyyy'), 'Marseille');
insert into Commande values (10523, 'SEVES', 7, TO_DATE('28/04/2007', 'dd/mm/yyyy'), TO_DATE('26/05/2007', 'dd/mm/yyyy'), TO_DATE('27/05/2007', 'dd/mm/yyyy'), 'London');
insert into Commande values (10681, 'GREAL', 3, TO_DATE('22/09/2007', 'dd/mm/yyyy'), TO_DATE('20/10/2007', 'dd/mm/yyyy'), TO_DATE('27/09/2007', 'dd/mm/yyyy'), 'Eugene');
end

begin
	insert into DetailsCommande values (10265, 17, 30, 0);
	insert into DetailsCommande values (10334, 68, 10, 0);
	insert into DetailsCommande values (10431, 17, 50, 25);
	insert into DetailsCommande values (10436, 56, 40, 10);
	insert into DetailsCommande values (10454, 16, 20, 20);
	insert into DetailsCommande values (10457, 59, 36, 0);
	insert into DetailsCommande values (10511, 4, 50, 15);
	insert into DetailsCommande values (10511, 8, 10, 15);
	insert into DetailsCommande values (10523, 17, 25, 10);
	insert into DetailsCommande values (10523, 20, 15, 10);
	insert into DetailsCommande values (10681, 19, 30, 10);
	insert into DetailsCommande values (10681, 20, 20, 0);
	insert into DetailsCommande values (10681, 68, 30, 20);
end