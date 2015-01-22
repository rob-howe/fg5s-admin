USE forest_glade;
UPDATE age_group set day='Saturday May 24th' where description IN ('U8', 'U10', 'U12', 'U14', 'U16', 'U18');
UPDATE age_group set description='U12 Girls' where description = 'U11 Girls';
UPDATE age_group set description='U14 Girls' where description = 'U13 Girls';
UPDATE age_group set day='Sunday May 25th' where description IN ('U7', 'U9', 'U11', 'U12 Girls', 'U14 Girls', 'U13', 'U15');

TRUNCATE fives_team;

ALTER TABLE fives_team ADD team_league varchar(70);