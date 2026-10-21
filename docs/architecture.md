---
layout: page
title: Architektur
sidebar: 2
---
# Architektur

![Architektur des Unified Office Workspace]({{ '/assets/architecture.svg' | relative_url }})

## Architekturprinzipien

Die Anwendung verwendet einen **modularen Monolithen**. Fachliche Module teilen sich Deployment und Laufzeit, halten jedoch klar definierte Service- und Persistenzgrenzen ein. Dies reduziert verteilte Fehlerquellen gegenüber einer frühen Microservice-Architektur.

### Frontend

**Nuxt 4** ist das Vue-basierte Anwendungsframework. Es ermöglicht dateibasierte Routen, serverseitige API-Proxies und einen strukturierten Aufbau unter `apps/web/app/`. **Vue 3** liefert reaktive Komponenten und Composition API. **Nuxt UI** stellt zugängliche Formular- und Navigationskomponenten bereit.

Das Dashboard benutzt derzeit eine einfache responsive Rasteransicht. Drag-and-drop/Resize mit GridStack, Widget Registry und mehrere Dashboards sind für den nächsten Meilenstein vorgesehen und noch nicht produktiv.

### Backend

**FastAPI** definiert HTTP-Endpunkte unter `/api/v1`. **Pydantic** validiert API-Eingaben; **SQLAlchemy** bildet die Tabellen auf Python-Modelle ab. **Alembic** verwaltet Schemaänderungen. Die lokale API enthält Endpunkte für Tasks, Notes, Bookmarks und ein einfaches Dashboard-Layout.

### Persistenz

**PostgreSQL** ist die Quelle der Wahrheit für lokal angelegte Daten. Die Entwicklungsversion besitzt noch keine mandantenfähige Benutzer- und Workspace-Isolation. Deshalb darf sie nicht öffentlich betrieben werden.

### Hybrid Storage

In der Zielarchitektur bleiben Mails und externe Kalender beim jeweiligen Anbieter autoritativ. Provider-Adapter erzeugen synchronisierte lokale Projektionen. Konflikte werden anhand von Revisionen erkannt, nicht durch stilles Überschreiben gelöst. Diese Adapter, die Worker und das Outbox-System sind geplant, nicht Bestandteil der aktuellen Version.

## Datenfluss

1. Ein Widget ruft die Nuxt-API unter `/api/v1` auf.
2. Der Nuxt-Server leitet die Anfrage an den internen FastAPI-Dienst weiter.
3. Pydantic validiert die Nutzdaten; SQLAlchemy führt die Datenbankoperation aus.
4. FastAPI antwortet mit JSON; Vue aktualisiert die Ansicht.

## Repository-Aufteilung

| Repository | Aufgabe |
|---|---|
| `unified-office-workshop` (privat) | Anwendungsquellcode, Backend, Frontend, Tests, Docker |
| `unified-office-workshop-public` | Jekyll-Dokumentation, Hydebar, GitHub Pages aus `docs/` |

Siehe [Technologien]({{ '/technologies' | relative_url }}) und [Installation]({{ '/getting-started' | relative_url }}).
