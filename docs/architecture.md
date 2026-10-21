---
layout: default
title: Architecture
nav_order: 3
---
# Architecture

The Office Workspace is a modular monolith:

- **Frontend:** Nuxt 4 and Nuxt UI
- **Backend:** Python / FastAPI, REST endpoints
- **Storage:** PostgreSQL for local tasks, notes, bookmarks and layout
- **Operations:** Docker Compose and `justfile`
- **Planned:** Redis workers, GridStack widget system, Gmail/IMAP/SMTP and CalDAV/Google Calendar provider adapters

## Hybrid data ownership

Locally created notes, tasks and bookmarks are authoritative in PostgreSQL. External email and calendar resources remain authoritative at their provider and use local projections with explicit synchronization state.

## Security

Version 0.1.0 has no authentication, tenant isolation or production hardening. It must remain on localhost until these are implemented.
