-- Sample data so the storefront has something to show out of the box.
-- Replace image paths and prices with the artist's real work and pricing.

-- ===== Products =====
INSERT INTO products (slug, name, category, description, base_price, image_url, configurable, sort_order) VALUES
  ('binder-cloudpup',    'CloudPup Binder',       'binder',   'Sky blue binder with a cute puppy sitting on clouds. Soft touch finish.',                      45.00, '/images/products/binder-cloudpup.jpg',    1, 1),
  ('binder-moonbun',     'MoonBun Binder',        'binder',   'Lavender binder with a bunny perched on a crescent moon. Matte finish.',                       45.00, '/images/products/binder-moonbun.jpg',     1, 2),
  ('binder-lilypad',     'Lilypad Binder',        'binder',   'Mint green binder with a frog on a lily pad surrounded by lotus flowers. Soft touch.',          45.00, '/images/products/binder-lilypad.jpg',     1, 3),
  ('binder-pawstar',     'PawStar Binder',        'binder',   'Soft pink binder with a kitten holding a star among sparkles and clouds. Matte finish.',        45.00, '/images/products/binder-pawstar.jpg',     1, 4),
  ('deckbox-clouddle',   'Clouddle Deck Box',     'deckbox',  'Sky blue deck box with a polar bear cub on clouds. Soft touch finish.',                         25.00, '/images/products/deckbox-clouddle.jpg',   1, 5),
  ('deckbox-moonwhisker','MoonWhisker Deck Box',  'deckbox',  'Deep indigo deck box with a moon cat sitting on purple clouds. Matte finish.',                  25.00, '/images/products/deckbox-moonwhisker.jpg',1, 6),
  ('deckbox-starpaw',    'StarPaw Deck Box',      'deckbox',  'Soft pink deck box with a white kitten hugging a golden star. Matte finish.',                   25.00, '/images/products/deckbox-starpaw.jpg',    1, 7),
  ('deckbox-lilyhop',    'LilyHop Deck Box',      'deckbox',  'Mint green deck box with a frog on a lily pad and lotus flowers. Soft touch.',                  25.00, '/images/products/deckbox-lilyhop.jpg',    1, 8),
  ('custom-poster',      'Custom Art Poster',     'poster',   'A printed poster of an original illustration, framed to your liking.',                          30.00, '/images/products/poster.svg',             1, 9),
  ('custom-playmat',     'Custom Playmat',        'playmat',  'A full-size playmat featuring original artwork for tournament or casual play.',                  40.00, '/images/products/playmat.svg',            1, 10),
  ('custom-card-art',    'Custom Card Art',       'card_art', 'A hand-painted or digitally illustrated piece based on your favorite TCG card.',                60.00, '/images/products/card-art.svg',           1, 11);

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
  ('CloudPup Binder',    '/images/products/binder-cloudpup.jpg',    'Sky blue binder design featuring a puppy on clouds with a rainbow. Soft touch finish.',      'Digital illustration', 45.00, 1, 1),
  ('MoonBun Binder',     '/images/products/binder-moonbun.jpg',     'Lavender binder design with a bunny on a crescent moon holding a star. Matte finish.',        'Digital illustration', 45.00, 1, 2),
  ('Lilypad Binder',     '/images/products/binder-lilypad.jpg',     'Mint green binder design with a frog on a lily pad surrounded by lotus blossoms.',            'Digital illustration', 45.00, 1, 3),
  ('PawStar Binder',     '/images/products/binder-pawstar.jpg',     'Soft pink binder design with a kitten holding a cookie star among clouds and sparkles.',      'Digital illustration', 45.00, 1, 4),
  ('Clouddle Deck Box',  '/images/products/deckbox-clouddle.jpg',   'Sky blue deck box with a polar bear cub holding a star on fluffy clouds.',                    'Digital illustration', 25.00, 1, 5),
  ('MoonWhisker Deck Box','/images/products/deckbox-moonwhisker.jpg','Deep indigo deck box featuring a moon cat on swirling purple clouds.',                       'Digital illustration', 25.00, 1, 6);
