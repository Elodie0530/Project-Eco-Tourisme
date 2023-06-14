create table user (
  id int(11) unsigned primary key not null AUTO_INCREMENT,
  username varchar(80) not null unique,
  email varchar(80) not null unique,
  password varchar(80) not null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO user (username, email, password) VALUES ('user', 'wcd@gmail.com', 'admin');

create table category (
id int(11) unsigned primary key not null AUTO_INCREMENT,
title varchar(100) not null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO category (title) VALUES ('Energy'),('Eau'),('Gestion des dechets'),('Biodeversité'), ('Communication et Sensibilitaion'),('Responsabilité sociale') ;
create table question (
  id int(11) unsigned primary key not null AUTO_INCREMENT,
  content varchar(900) not null,
  mandatory_level varchar(80) not null,
  category_id int unsigned not null,
  info_bulles varchar(900),
  CONSTRAINT fk_category_id 
  FOREIGN KEY (category_id)
  REFERENCES category(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO question (content, mandatory_level, category_id, info_bulles) VALUES 
  ('Entretien des espaces extérieurs sans produits phytosanitaires : herbicides, fongicides, insecticides, etc.', 'obligatoire', 4, NULL),

  ('Choix d''espèce végétales non invasives', 'obligatoire', 4, 'Certaines espèces exotiques envahissantes font l''objet d''une surveillance comme par exemple la renouée du Japon, l''herbe de la pampa, l''armoisie à feuille épi, etc.'),

  ('Les aménagements extérieurs ne doivent pas représenter de danger pour la biodiversité (ex. risque de noyade dans un bac récupérateur d''eau de pluie).', 'obligatoire', 4, NULL),

  ('Espèces végétales principalement locales avec un impact positif sur la biodiversité : mellifères, baies pour les oiseaux, etc', 'essentiel', 4, NULL),

  ('Aménagements en faveur de l''accueil de la biodiversité (au moins trois) parmi : nichoir, mangeoire (été/hiver), mare, refuge à hérisson, hôtel à insectes (disposé judicieusement), etc.', 'essentiel', 4, NULL),

  ('Engagement dans un réseau / label en faveur de la biodiversité', 'Optionnel', 4, 'P. ex : LPO');



create table user_survey (
  id int(11) unsigned primary key not null AUTO_INCREMENT,
  user_id int unsigned not null,
  CONSTRAINT fk_user_id
  FOREIGN KEY (user_id)
  REFERENCES user(id),
  category_id int unsigned not null,
  CONSTRAINT fk_survey_category_id 
  FOREIGN KEY (category_id)
  REFERENCES category(id),
  score int unsigned not null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;