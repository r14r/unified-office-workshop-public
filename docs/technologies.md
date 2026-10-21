---
layout: page
title: Technologien
sidebar: 3
---
# Frameworks und Technologien

## Nuxt 4

Nuxt ist ein Framework auf Basis von Vue 3. Das Projekt verwendet Nuxt für die Browseroberfläche, dateibasierte Navigation, Laufzeitkonfiguration und den internen API-Proxy. Das Verzeichnis `apps/web/app/pages/` enthält die Routen; unter `apps/web/server/api/` werden Aufrufe an den Python-Dienst weitergeleitet.

- **Vorteil:** Gemeinsames Frontend-Projekt mit Vue-Komponenten und TypeScript.
- **Im Projekt:** Ein initiales Dashboard mit Tasks, Notizen, Bookmarks und Uhrzeit.
- **Geplant:** Persistente, frei konfigurierbare Widgetinstanzen, Drag-and-drop und mehrseitige Arbeitsbereiche.

Dokumentation: [nuxt.com](https://nuxt.com/docs/4.x)

## Vue 3 und Nuxt UI

Vue verwendet reaktive Zustandsverwaltung: Änderungen an `ref()`-Werten aktualisieren die Ansicht automatisch. Die **Composition API** erlaubt das Teilen fachlicher Logik über Composables. Nuxt UI ergänzt wiederverwendbare Komponenten und verwendet Tailwind CSS als Styling-Grundlage.

Dokumentation: [Vue](https://vuejs.org/) · [Nuxt UI](https://ui.nuxt.com/)

## Python und FastAPI

FastAPI erstellt typisierte Web-Endpunkte und stellt eine OpenAPI-Beschreibung bereit. Pydantic prüft Requests. Die API bleibt von der Oberfläche getrennt, sodass weitere Clients dieselben Fachfunktionen nutzen können.

- **HTTP:** REST-artige JSON-Endpunkte
- **Validierung:** Pydantic-Modelle
- **Persistenz:** SQLAlchemy mit asynchronem Datenbanktreiber
- **Geplant:** Authentifizierung, Rechte, Echtzeitereignisse und Connectoren

Dokumentation: [FastAPI](https://fastapi.tiangolo.com/)

## PostgreSQL, SQLAlchemy und Alembic

**PostgreSQL** speichert Tasks, Notes, Bookmarks und Dashboardlayouts. **SQLAlchemy** stellt Python-ORM-Modelle bereit. **Alembic** enthält versionierte Migrationen, damit die Struktur einer bestehenden Datenbank kontrolliert erweitert werden kann.

Die Datenbank wird über Docker Compose gestartet. Daten bleiben in einem benannten Docker-Volume erhalten.

Dokumentation: [PostgreSQL](https://www.postgresql.org/docs/) · [SQLAlchemy](https://docs.sqlalchemy.org/) · [Alembic](https://alembic.sqlalchemy.org/)

## Docker Compose und just

**Docker Compose** definiert die lokalen Dienste: Nuxt, FastAPI, PostgreSQL und Redis. **just** bündelt wiederkehrende Befehle, etwa `just up`, `just migrate`, `just status` und `just test`. Die öffentliche Dokumentation besitzt ein eigenes `justfile` mit `install`, `build` und `serve`.

## Jekyll und Hydebar

**Jekyll** wandelt Markdown und Liquid-Templates in statische HTML-Seiten um. **Hydebar** stellt das Sidebar-Layout und Sass-Styling bereit. GitHub Pages baut die Dokumentation aus dem Verzeichnis `docs/` des öffentlichen Repositories.

Die lokalen Befehle lauten:

```bash
just install
just build
just serve
```

Der Veröffentlichungs-Pfad `/unified-office-workshop-public/` wird über Jekylls `baseurl` berücksichtigt.

Originaltemplate: [ogobrecht/hydebar](https://github.com/ogobrecht/hydebar).
