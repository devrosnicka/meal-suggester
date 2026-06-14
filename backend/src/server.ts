import Fastify from 'fastify';
import staticPlugin from '@fastify/static';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import { suggestionRoute } from './routes/suggestion.js';

const __dirname = dirname(fileURLToPath(import.meta.url));

const app = Fastify({ logger: true });

app.register(staticPlugin, {
  root: join(__dirname, '../frontend'),
  prefix: '/',
});

app.register(suggestionRoute);

const PORT = Number(process.env.PORT ?? 3000);

try {
  await app.listen({ port: PORT, host: '0.0.0.0' });
} catch (err) {
  app.log.error(err);
  process.exit(1);
}
