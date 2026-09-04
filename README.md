# Fleet Catalog

Personal multi-VPS service catalog and thin control plane.

- **Contract:** `fleet.yaml` in each workload repo
- **Runtime:** Docker Compose (binaries wrapped in images)
- **Ingress:** Cloudflare Tunnel + Access — `public` / `access` / `private`
- **Orchestration:** outbound `fleet-agent` desired-state reconcile
- **Binaries:** `fleetd` (control plane), `fleet-agent` (node)

This is a Phase 1 MVP. The source of truth for protocols, schemas, and APIs is **[docs/SDD.md](docs/SDD.md)**.

## Status

Phase 1 implementation in progress (schema → SQLite → API → agent → Cloudflare → UI → bootstrap).

## Scale

Designed for 2–10 pet VPS, 5–40 services, one operator. Not Kubernetes.

## Quick pointers

| Doc | What |
| --- | --- |
| [docs/SDD.md](docs/SDD.md) | Software design document |
| [docs/bootstrap.md](docs/bootstrap.md) | First-node / WARP checklist (after PR-7) |
| `examples/hello-healthz` | Minimal `/healthz` workload |
| `contrib/github-actions/deploy.yml` | Copy into a workload repo |

## Adjacent tools (not this repo)

- [`vps-hygiene`](https://github.com/fallrising) — host inventory/cleanup. Fleet does not exec those scripts.
- [`clarkQ`](https://github.com/fallrising/clarkQ) — application queue. Never the fleet control bus.

## License

Apache-2.0
