-- Sample data so the storefront has something to show out of the box.
-- Replace image paths and prices with the artist's real work and pricing.

-- ===== Products =====
INSERT INTO products (slug, name, category, description, base_price, image_url, configurable, sort_order) VALUES
  ('custom-tcg-binder', 'Custom TCG Binder', 'binder', 'A hand-painted binder cover to store and show off your favorite cards.', 45.00, '/images/products/binder.svg', 1, 1),
  ('custom-deck-box', 'Custom Deck Box', 'deckbox', 'A one-of-a-kind deck box with custom art for your TCG deck.', 25.00, '/images/products/deckbox.svg', 1, 2),
  ('custom-poster', 'Custom Art Poster', 'poster', 'A printed poster of an original illustration, framed to your liking.', 30.00, '/images/products/poster.svg', 1, 3),
  ('custom-playmat', 'Custom Playmat', 'playmat', 'A full-size playmat featuring original artwork for tournament or casual play.', 40.00, '/images/products/playmat.svg', 1, 4),
  ('custom-card-art', 'Custom Card Art', 'card_art', 'A hand-painted or digitally illustrated piece based on your favorite TCG card.', 60.00, '/images/products/card-art.svg', 1, 5);

-- ===== Option groups & choices =====

-- Binder
INSERT INTO option_groups (category, key, label, sort_order) VALUES ('binder', 'size', 'Pocket Size', 1);
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, '4-Pocket', '/images/options/size-small.svg', 0, 1 FROM option_groups WHERE category='binder' AND key='size';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, '9-Pocket', '/images/options/size-medium.svg', 10, 2 FROM option_groups WHERE category='binder' AND key='size';

INSERT INTO option_groups (category, key, label, sort_order) VALUES ('binder', 'material', 'Cover Material', 2);
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Vegan Leather', '/images/options/material-vegan-leather.svg', 0, 1 FROM option_groups WHERE category='binder' AND key='material';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Canvas', '/images/options/material-canvas.svg', 0, 2 FROM option_groups WHERE category='binder' AND key='material';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Premium Leather', '/images/options/material-premium-leather.svg', 15, 3 FROM option_groups WHERE category='binder' AND key='material';

INSERT INTO option_groups (category, key, label, sort_order) VALUES ('binder', 'design', 'Cover Design', 3);
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Fully Custom Illustration', '/images/options/design-custom.svg', 0, 1 FROM option_groups WHERE category='binder' AND key='design';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Pattern / Theme Design', '/images/options/design-pattern.svg', -5, 2 FROM option_groups WHERE category='binder' AND key='design';

-- Deck Box
INSERT INTO option_groups (category, key, label, sort_order) VALUES ('deckbox', 'size', 'Capacity', 1);
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Standard (~80 cards)', '/images/options/size-small.svg', 0, 1 FROM option_groups WHERE category='deckbox' AND key='size';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Large (~100 cards)', '/images/options/size-medium.svg', 5, 2 FROM option_groups WHERE category='deckbox' AND key='size';

INSERT INTO option_groups (category, key, label, sort_order) VALUES ('deckbox', 'material', 'Material', 2);
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Wood', '/images/options/material-wood.svg', 0, 1 FROM option_groups WHERE category='deckbox' AND key='material';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Acrylic', '/images/options/material-acrylic.svg', 5, 2 FROM option_groups WHERE category='deckbox' AND key='material';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Magnetic Closure', '/images/options/material-magnetic.svg', 8, 3 FROM option_groups WHERE category='deckbox' AND key='material';

INSERT INTO option_groups (category, key, label, sort_order) VALUES ('deckbox', 'design', 'Design', 3);
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Fully Custom Illustration', '/images/options/design-custom.svg', 0, 1 FROM option_groups WHERE category='deckbox' AND key='design';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Pattern / Theme Design', '/images/options/design-pattern.svg', -3, 2 FROM option_groups WHERE category='deckbox' AND key='design';

-- Poster
INSERT INTO option_groups (category, key, label, sort_order) VALUES ('poster', 'size', 'Print Size', 1);
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, '11" x 17"', '/images/options/size-small.svg', 0, 1 FROM option_groups WHERE category='poster' AND key='size';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, '18" x 24"', '/images/options/size-medium.svg', 15, 2 FROM option_groups WHERE category='poster' AND key='size';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, '24" x 36"', '/images/options/size-large.svg', 30, 3 FROM option_groups WHERE category='poster' AND key='size';

INSERT INTO option_groups (category, key, label, sort_order) VALUES ('poster', 'frame', 'Frame', 2);
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'No Frame', '/images/options/frame-none.svg', 0, 1 FROM option_groups WHERE category='poster' AND key='frame';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Black Wood Frame', '/images/options/frame-black.svg', 20, 2 FROM option_groups WHERE category='poster' AND key='frame';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Walnut Frame', '/images/options/frame-walnut.svg', 25, 3 FROM option_groups WHERE category='poster' AND key='frame';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'White Frame', '/images/options/frame-white.svg', 20, 4 FROM option_groups WHERE category='poster' AND key='frame';

INSERT INTO option_groups (category, key, label, sort_order) VALUES ('poster', 'material', 'Paper / Finish', 3);
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Matte', '/images/options/material-matte.svg', 0, 1 FROM option_groups WHERE category='poster' AND key='material';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Glossy', '/images/options/material-glossy.svg', 0, 2 FROM option_groups WHERE category='poster' AND key='material';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Premium Luster', '/images/options/material-luster.svg', 5, 3 FROM option_groups WHERE category='poster' AND key='material';

-- Playmat
INSERT INTO option_groups (category, key, label, sort_order) VALUES ('playmat', 'size', 'Size', 1);
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Standard (24" x 14")', '/images/options/size-small.svg', 0, 1 FROM option_groups WHERE category='playmat' AND key='size';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Extended (36" x 24")', '/images/options/size-medium.svg', 15, 2 FROM option_groups WHERE category='playmat' AND key='size';

INSERT INTO option_groups (category, key, label, sort_order) VALUES ('playmat', 'material', 'Surface', 2);
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Cloth', '/images/options/material-cloth.svg', 0, 1 FROM option_groups WHERE category='playmat' AND key='material';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Smooth Rubber', '/images/options/material-rubber.svg', 8, 2 FROM option_groups WHERE category='playmat' AND key='material';

INSERT INTO option_groups (category, key, label, sort_order) VALUES ('playmat', 'edge', 'Edge Finish', 3);
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Standard Edge', '/images/options/material-cloth.svg', 0, 1 FROM option_groups WHERE category='playmat' AND key='edge';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Stitched Edge', '/images/options/material-stitched.svg', 5, 2 FROM option_groups WHERE category='playmat' AND key='edge';

-- Custom Card Art
INSERT INTO option_groups (category, key, label, sort_order) VALUES ('card_art', 'game', 'Game', 1);
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Pokemon', '/images/options/game-pokemon.svg', 0, 1 FROM option_groups WHERE category='card_art' AND key='game';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Magic: The Gathering', '/images/options/game-mtg.svg', 0, 2 FROM option_groups WHERE category='card_art' AND key='game';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Yu-Gi-Oh!', '/images/options/game-yugioh.svg', 0, 3 FROM option_groups WHERE category='card_art' AND key='game';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Other / Custom TCG', '/images/options/game-other.svg', 0, 4 FROM option_groups WHERE category='card_art' AND key='game';

INSERT INTO option_groups (category, key, label, sort_order) VALUES ('card_art', 'style', 'Art Style', 2);
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Full Illustration', '/images/options/style-illustration.svg', 0, 1 FROM option_groups WHERE category='card_art' AND key='style';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Sketch / Lineart', '/images/options/style-sketch.svg', -20, 2 FROM option_groups WHERE category='card_art' AND key='style';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Full Digital Painting', '/images/options/style-digital.svg', 10, 3 FROM option_groups WHERE category='card_art' AND key='style';

INSERT INTO option_groups (category, key, label, sort_order) VALUES ('card_art', 'format', 'Final Format', 3);
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Card-Sized Print', '/images/options/format-card.svg', 0, 1 FROM option_groups WHERE category='card_art' AND key='format';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'A4 Print', '/images/options/format-a4.svg', 15, 2 FROM option_groups WHERE category='card_art' AND key='format';
INSERT INTO option_choices (group_id, label, image_url, price_modifier, sort_order)
  SELECT id, 'Digital File Only', '/images/options/format-digital.svg', -10, 3 FROM option_groups WHERE category='card_art' AND key='format';

-- ===== Gallery =====
INSERT INTO gallery_items (title, image_url, description, medium, price, available, sort_order) VALUES
  ('Charizard Study', '/images/gallery/piece-1.svg', 'A watercolor study inspired by Charizard.', 'Watercolor on paper', 120.00, 1, 1),
  ('Forest Spirit', '/images/gallery/piece-2.svg', 'Original character illustration, digital painting.', 'Digital painting', 180.00, 1, 2),
  ('Moonlit Garden', '/images/gallery/piece-3.svg', 'An original gouache piece exploring color and light.', 'Gouache on board', 150.00, 0, 3),
  ('Trainer Portrait', '/images/gallery/piece-4.svg', 'Custom trainer portrait commission, ink and watercolor.', 'Ink & watercolor', 95.00, 1, 4),
  ('Eevee Evolutions', '/images/gallery/piece-5.svg', 'A playful study of the Eevee evolution line.', 'Digital illustration', 0, 0, 5),
  ('Card Back Pattern', '/images/gallery/piece-6.svg', 'Original pattern design, available as a binder or deck box cover.', 'Digital pattern', 0, 0, 6);
