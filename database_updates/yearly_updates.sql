USE forest_glade;
UPDATE age_group set day='Saturday May 27th' where description IN ('U6', 'U8', 'U10', 'U12', 'U14', 'U16', 'U18');
UPDATE age_group set description='U15 Girls' where description = 'U14 Girls';
UPDATE age_group set day='Sunday May 28th' where description IN ('U7', 'U9', 'U11', 'U15 Girls', 'U13', 'U15');

TRUNCATE fives_team;
