CREATE TABLE IF NOT EXISTS meals (
  id          SERIAL PRIMARY KEY,
  category    VARCHAR(20) NOT NULL CHECK (category IN ('breakfast','lunch','dinner')),
  name        VARCHAR(100) NOT NULL,
  description TEXT NOT NULL
);

INSERT INTO meals (category, name, description) VALUES
  ('breakfast', 'Avocado Toast',        'Toasted sourdough with smashed avocado, cherry tomatoes, and a poached egg.'),
  ('breakfast', 'Greek Yogurt Bowl',    'Thick Greek yogurt with honey, granola, and fresh berries.'),
  ('breakfast', 'Veggie Omelette',      'Fluffy three-egg omelette with spinach, feta, and roasted peppers.'),
  ('lunch',     'Caprese Salad',        'Fresh mozzarella, heirloom tomatoes, basil, and olive oil.'),
  ('lunch',     'Grilled Chicken Wrap', 'Seasoned chicken, romaine, and tzatziki in a whole-wheat tortilla.'),
  ('lunch',     'Lentil Soup',          'Hearty red lentil soup with cumin, lemon, and crusty bread.'),
  ('dinner',    'Pasta Carbonara',      'Spaghetti with pancetta, egg-yolk sauce, and Pecorino Romano.'),
  ('dinner',    'Salmon with Veggies',  'Pan-seared salmon with roasted asparagus and lemon-dill butter.'),
  ('dinner',    'Black Bean Tacos',     'Spiced black beans in corn tortillas with pickled onion and avocado crema.');
