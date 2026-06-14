import type { APIRoute } from 'astro';
import { createInquiry, type NewInquiry } from '../../lib/db';

const VALID_TYPES: NewInquiry['type'][] = ['contact', 'commission', 'card_art', 'custom_order'];

export const POST: APIRoute = async ({ request, locals }) => {
  let body: Record<string, unknown>;
  try {
    body = await request.json();
  } catch {
    return new Response(JSON.stringify({ error: 'Invalid JSON body' }), { status: 400 });
  }

  const { type, name, email, message, details } = body;

  if (
    typeof type !== 'string' ||
    !VALID_TYPES.includes(type as NewInquiry['type']) ||
    typeof name !== 'string' ||
    !name.trim() ||
    typeof email !== 'string' ||
    !email.trim()
  ) {
    return new Response(JSON.stringify({ error: 'Missing or invalid required fields' }), { status: 400 });
  }

  await createInquiry(locals.runtime.env.DB, {
    type: type as NewInquiry['type'],
    name: name.trim(),
    email: email.trim(),
    message: typeof message === 'string' ? message.trim() : undefined,
    details,
  });

  return new Response(JSON.stringify({ ok: true }), {
    status: 201,
    headers: { 'Content-Type': 'application/json' },
  });
};
