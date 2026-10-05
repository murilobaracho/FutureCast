// Acesso ao banco (Neon) direto do navegador. A URL vem de config.js.
let _sql = null;

async function sql(query, params = []) {
  if (!_sql) {
    const { neon } = await import('https://esm.sh/@neondatabase/serverless@0.10.4');
    _sql = neon(window.FUTURECAST_DB_URL);
  }
  return _sql(query, params);
}

function sair() {
  try { localStorage.removeItem('futurecast_usuario'); } catch {}
}
