CREATE TABLE IF NOT EXISTS meals (
  id          SERIAL PRIMARY KEY,
  category    VARCHAR(20) NOT NULL CHECK (category IN ('breakfast','lunch','dinner')),
  name        VARCHAR(100) NOT NULL,
  description TEXT NOT NULL
);

INSERT INTO meals (category, name, description) VALUES
  ('breakfast', 'Avokádový toast',         'Opečený kváskový chléb se šťouchaným avokádem, cherry rajčátky a vajíčkem.'),
  ('breakfast', 'Řecký jogurt s granolou', 'Hustý řecký jogurt s medem, granolou a čerstvým ovocem.'),
  ('breakfast', 'Zeleninová omeleta',      'Nadýchaná omeleta ze tří vajec se špenátem, fetou a pečenými paprikami.'),
  ('lunch',     'Caprese salát',           'Čerstvá mozzarella, rajčata, bazalka a olivový olej.'),
  ('lunch',     'Wrap s kuřetem',          'Grilované kuřecí maso, římský salát a tzatziki v celozrnné tortille.'),
  ('lunch',     'Čočková polévka',         'Vydatná polévka z červené čočky s kmínem, citronem a křupavým chlebem.'),
  ('dinner',    'Pasta carbonara',         'Špagety s pancettou, omáčkou z vaječného žloutku a sýrem Pecorino Romano.'),
  ('dinner',    'Losos se zeleninou',      'Opečený losos s pečeným chřestem a citronovo-koprovým máslem.'),
  ('dinner',    'Tacos s černými fazolemi','Kořeněné černé fazole v kukuřičných tortillách s nakládanou cibulkou a avokádovým krémem.');
