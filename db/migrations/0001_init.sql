-- Core schema for the art storefront

CREATE TABLE IF NOT EXISTS products (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  category TEXT NOT NULL, -- 'binder' | 'deckbox' | 'poster' | 'playmat' | 'card_art' | 'original'
  description TEXT,
  base_price REAL NOT NULL DEFAULT 0,
  image_url TEXT,
  configurable INTEGER NOT NULL DEFAULT 0, -- 1 = usable in the custom builder
  active INTEGER NOT NULL DEFAULT 1,
  sort_order INTEGER NOT NULL DEFAULT 0
);

-- Groups of choices shown in the custom builder, scoped per product category
-- e.g. category='binder', key='material', label='Material'
CREATE TABLE IF NOT EXISTS option_groups (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  category TEXT NOT NULL,
  key TEXT NOT NULL,
  label TEXT NOT NULL,
  sort_order INTEGER NOT NULL DEFAULT 0,
  UNIQUE(category, key)
);

-- Individual selectable choices within an option group
-- e.g. group 'frame' -> choices 'Black Wood', 'Walnut', 'None'
CREATE TABLE IF NOT EXISTS option_choices (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  group_id INTEGER NOT NULL REFERENCES option_groups(id) ON DELETE CASCADE,
  label TEXT NOT NULL,
  image_url TEXT,
  price_modifier REAL NOT NULL DEFAULT 0,
  sort_order INTEGER NOT NULL DEFAULT 0
);

-- Gallery / portfolio pieces
CREATE TABLE IF NOT EXISTS gallery_items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  image_url TEXT NOT NULL,
  description TEXT,
  medium TEXT,
  price REAL,
  available INTEGER NOT NULL DEFAULT 0,
  sort_order INTEGER NOT NULL DEFAULT 0
);

-- All inquiries: contact messages, commission requests, custom builder orders
CREATE TABLE IF NOT EXISTS inquiries (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  type TEXT NOT NULL, -- 'contact' | 'commission' | 'card_art' | 'custom_order'
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  message TEXT,
  details TEXT, -- JSON blob with structured info (product, selected options, total price, etc.)
  status TEXT NOT NULL DEFAULT 'new'
);

CREATE INDEX IF NOT EXISTS idx_products_category ON products(category);
CREATE INDEX IF NOT EXISTS idx_option_groups_category ON option_groups(category);
CREATE INDEX IF NOT EXISTS idx_option_choices_group ON option_choices(group_id);
CREATE INDEX IF NOT EXISTS idx_inquiries_type ON inquiries(type);
