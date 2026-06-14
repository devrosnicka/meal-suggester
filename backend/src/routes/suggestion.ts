import type { FastifyInstance } from 'fastify';
import { pool } from '../db.js';

type MealWindow = 'breakfast' | 'lunch' | 'dinner' | 'none';

function getMealWindow(hour: number): MealWindow {
  if (hour >= 6  && hour <= 10) return 'breakfast';
  if (hour >= 11 && hour <= 14) return 'lunch';
  if (hour >= 15 && hour <= 21) return 'dinner';
  return 'none';
}

export async function suggestionRoute(app: FastifyInstance) {
  app.get('/api/suggestion', async (_req, reply) => {
    const now = new Date();
    const window = getMealWindow(now.getHours());

    if (window === 'none') {
      return reply.send({ window: 'none', meal: null, serverTime: now.toISOString() });
    }

    const { rows } = await pool.query<{ name: string; description: string }>(
      `SELECT name, description FROM meals WHERE category = $1 ORDER BY random() LIMIT 1`,
      [window]
    );

    return reply.send({ window, meal: rows[0] ?? null, serverTime: now.toISOString() });
  });
}
