# Art Storefront

An Astro site for browsing original artwork, ordering custom TCG gear (binders, deck boxes,
posters, playmats), and requesting Pokémon-focused card art commissions. Deploys to Cloudflare
Pages with a D1 database for products, builder options, and inquiries.

## Project Structure

```text
/
├── db/
│   ├── migrations/0001_init.sql   # D1 schema
│   └── seed.sql                   # Sample products, options, and gallery items
├── public/images/                 # Placeholder artwork/option images — replace with real photos
├── src/
│   ├── components/                # Header, Footer
│   ├── config.ts                  # Site name, tagline, contact/social links
│   ├── layouts/Layout.astro
│   ├── lib/db.ts                  # D1 query helpers
│   └── pages/
│       ├── index.astro            # Home
│       ├── gallery.astro          # Portfolio / available originals
│       ├── shop/                  # Product listing + detail pages
│       ├── builder.astro          # Custom configurator with live pricing
│       ├── commission.astro       # Card art / commission request form
│       ├── contact.astro          # General contact form
│       ├── about.astro
│       └── api/inquiry.ts         # POST endpoint — writes to D1 `inquiries` table
└── wrangler.toml
```

## Local Development

```sh
npm install

# Set up the local D1 database (run once, or after changing migrations/seed data)
npm run db:migrate:local
npm run db:seed:local

npm run dev
```

The dev server runs through the Cloudflare adapter's local platform proxy, so D1 access works
the same as it will in production.

## Editing Content

- **Branding**: edit `src/config.ts` (site name, tagline, artist name, email, social links).
- **Products & pricing**: edit `db/seed.sql` (or insert/update rows directly in D1) — products,
  option groups (frame, material, size, etc.), and option choices with their price modifiers.
- **Images**: replace the placeholder SVGs in `public/images/` with real photos. Keep the same
  file paths, or update the `image_url` columns in `db/seed.sql` to point at new files.
- **Gallery**: add rows to `gallery_items` in `db/seed.sql` for portfolio pieces.

## Deploying to Cloudflare

1. Create the D1 database:
   ```sh
   npx wrangler d1 create art-storefront-db
   ```
   Copy the resulting `database_id` into `wrangler.toml`.

2. Apply the schema and seed data to the remote database:
   ```sh
   npm run db:migrate:remote
   npm run db:seed:remote
   ```

3. Build and deploy:
   ```sh
   npm run build
   npx wrangler pages deploy dist
   ```

   Or connect the repo to Cloudflare Pages in the dashboard for automatic deploys on push —
   set the build command to `npm run build` and the output directory to `dist`. Make sure the
   D1 binding (`DB`) is configured in the Pages project's settings to match `wrangler.toml`.

## Inquiries

All form submissions (contact messages, commission requests, and custom builder orders) are
stored in the `inquiries` table in D1 with a `type` and a JSON `details` blob. Query them with:

```sh
npx wrangler d1 execute art-storefront-db --remote --command "SELECT * FROM inquiries ORDER BY created_at DESC"
```
