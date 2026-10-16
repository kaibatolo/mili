#!/usr/bin/env bash
# maintenance cheat sheet — source or run sections
# usage: bash maintenance.sh [check|keys|upgrade|status]

set -euo pipefail

echo "=== versions ==="
hermes --version || true
wrangler --version || true
supabase --version || true
node --version || true
python3 --version || true
docker --version || true
warp-cli --version || true
tailscale version || true

echo ""
echo "=== key validity (set env vars first) ==="
# Venice
if [[ -n "${VENICE_API_KEY:-}" ]]; then
  curl -s -o /dev/null -w "venice: %{http_code}\n" \
    -H "Authorization: Bearer $VENICE_API_KEY" \
    https://api.venice.ai/api/v1/models || true
fi
# xAI
if [[ -n "${XAI_API_KEY:-}" ]]; then
  curl -s -o /dev/null -w "xai: %{http_code}\n" \
    -H "Authorization: Bearer $XAI_API_KEY" \
    https://api.x.ai/v1/models || true
fi
# OpenRouter
if [[ -n "${OPENROUTER_API_KEY:-}" ]]; then
  curl -s -o /dev/null -w "openrouter: %{http_code}\n" \
    -H "Authorization: Bearer $OPENROUTER_API_KEY" \
    https://openrouter.ai/api/v1/models || true
fi
# Cloudflare
if [[ -n "${CLOUDFLARE_API_TOKEN:-}" ]]; then
  curl -s -o /dev/null -w "cloudflare: %{http_code}\n" \
    -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
    https://api.cloudflare.com/client/v4/user/tokens/verify || true
fi

echo ""
echo "=== upgrades ==="
# hermes
pip install --upgrade hermes-agent || true
# wrangler
npm update -g wrangler || true
# supabase
# re-run install curl or brew/npm update
# system
sudo apt update && sudo apt upgrade -y || true

echo ""
echo "=== hermes status ==="
hermes config || true
hermes doctor || true
ls -la ~/.hermes/ || true

echo ""
echo "=== mesh / tailscale status ==="
warp-cli status || true
tailscale status || true

echo "done."
