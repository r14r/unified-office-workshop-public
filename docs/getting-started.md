---
layout: page
title: Getting Started
sidebar: 3
---
# Getting started

Clone the private application repository using your authorized GitHub account.

```bash
git clone https://github.com/r14r/unified-office-workshop.git
cd unified-office-workshop
cp .env.example .env
just up
just migrate
```

Open http://localhost:43000.

Required: Docker, Docker Compose, and `just`. Do not expose this development build to the public Internet.
