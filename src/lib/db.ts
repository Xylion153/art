export interface Product {
  id: number;
  slug: string;
  name: string;
  category: string;
  description: string | null;
  base_price: number;
  image_url: string | null;
  configurable: number;
  active: number;
  sort_order: number;
}

export interface OptionChoice {
  id: number;
  group_id: number;
  label: string;
  image_url: string | null;
  price_modifier: number;
  sort_order: number;
}

export interface OptionGroup {
  id: number;
  category: string;
  key: string;
  label: string;
  sort_order: number;
  choices: OptionChoice[];
}

export interface GalleryItem {
  id: number;
  title: string;
  image_url: string;
  description: string | null;
  medium: string | null;
  price: number | null;
  available: number;
  sort_order: number;
}

export async function getProducts(db: D1Database): Promise<Product[]> {
  const { results } = await db
    .prepare('SELECT * FROM products WHERE active = 1 ORDER BY sort_order ASC')
    .all<Product>();
  return results ?? [];
}

export async function getProductBySlug(db: D1Database, slug: string): Promise<Product | null> {
  return db.prepare('SELECT * FROM products WHERE slug = ? AND active = 1').bind(slug).first<Product>();
}

export async function getOptionGroups(db: D1Database, category: string): Promise<OptionGroup[]> {
  const { results: groups } = await db
    .prepare('SELECT * FROM option_groups WHERE category = ? ORDER BY sort_order ASC')
    .bind(category)
    .all<Omit<OptionGroup, 'choices'>>();

  if (!groups || groups.length === 0) return [];

  const groupIds = groups.map((g) => g.id);
  const placeholders = groupIds.map(() => '?').join(',');
  const { results: choices } = await db
    .prepare(
      `SELECT * FROM option_choices WHERE group_id IN (${placeholders}) ORDER BY sort_order ASC`,
    )
    .bind(...groupIds)
    .all<OptionChoice>();

  return groups.map((group) => ({
    ...group,
    choices: (choices ?? []).filter((c) => c.group_id === group.id),
  }));
}

export async function getGalleryItems(db: D1Database): Promise<GalleryItem[]> {
  const { results } = await db
    .prepare('SELECT * FROM gallery_items ORDER BY sort_order ASC')
    .all<GalleryItem>();
  return results ?? [];
}

export interface NewInquiry {
  type: 'contact' | 'commission' | 'card_art' | 'custom_order';
  name: string;
  email: string;
  message?: string;
  details?: unknown;
}

export async function createInquiry(db: D1Database, inquiry: NewInquiry): Promise<void> {
  await db
    .prepare(
      'INSERT INTO inquiries (type, name, email, message, details) VALUES (?, ?, ?, ?, ?)',
    )
    .bind(
      inquiry.type,
      inquiry.name,
      inquiry.email,
      inquiry.message ?? null,
      inquiry.details ? JSON.stringify(inquiry.details) : null,
    )
    .run();
}
