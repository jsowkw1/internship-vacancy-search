# Technology Alternatives and Decisions

The decisions below are proposed for a small academic MVP. The current skill set of the two students was not supplied, so the team should confirm or change the stack with the supervisor before implementation.

## Decision 1: Frontend

| Alternative | Strengths | Trade-offs for this project | Decision |
|---|---|---|---|
| React + TypeScript | Component model, broad ecosystem, TypeScript support, straightforward interaction-heavy UI | Requires discipline around state and accessibility; team familiarity unconfirmed | **Proposed**: choose if both members can work comfortably in React; use typed components for search and filters |
| Vue 3 + TypeScript | Integrated component approach and approachable learning path | Smaller fit with existing React-oriented examples; team familiarity unconfirmed | Viable alternative if the team already knows Vue |
| Angular + TypeScript | Integrated routing, forms, and application conventions | More framework structure than a small MVP needs; steeper initial setup | Not preferred unless already required by coursework or team experience |

## Decision 2: Backend/API

| Alternative | Strengths | Trade-offs | Decision |
|---|---|---|---|
| FastAPI (Python) | Type-annotated API, validation, OpenAPI schema and interactive docs; suits a modular REST API | Python packaging and async database choices need care | **Proposed**: use for clear endpoint contracts and quick API iteration |
| Django REST Framework | Mature ORM, admin, authentication and conventional CRUD | More framework surface; API-only service can carry unused concepts | Use if built-in admin and team familiarity outweigh simplicity |
| Node.js + Express/Nest | One language across frontend and backend; broad ecosystem | Express requires more choices for validation and API structure; Nest adds conventions | Use if the team strongly prefers TypeScript end-to-end |

## Decision 3: Data storage and retrieval

| Alternative | Strengths | Trade-offs | Decision |
|---|---|---|---|
| PostgreSQL | Relational integrity for users, listings, employers, moderation and saves; built-in full-text search/ranking features | Russian/Kazakh morphological and synonym handling need explicit evaluation/configuration | **Proposed**: relational source of truth with indexed text and structured filters |
| MySQL | Mature relational database and broad hosting support | Similar relational fit; text-search behavior and indexing choices need separate validation | Viable alternative if hosting or course standards favor MySQL |
| MongoDB | Flexible document structure for heterogeneous source records | Referential integrity and many-to-many skills/employers require more application-side control | Not preferred while the domain is strongly relational |

## Decision summary

Use a **modular monolith** with a React/TypeScript client, FastAPI REST API, PostgreSQL database, and a static asset/prototype layer. Separate catalog/search, authentication, saved listings, employer submissions, moderation, and reporting into modules within one deployable application. Do not start with microservices or a learned recommender: current team size and lack of interaction data do not justify them.

The PostgreSQL full-text search documentation describes query normalization, matching, and ranking; it does not establish good support for all Kazakh/Russian morphology. The first MVP should evaluate a simple normalized lexical search and curated aliases against real-language examples. Semantic embeddings can be a later experiment if labeled or reviewed examples become available.

## Standards and source links

- React + TypeScript documentation: https://react.dev/learn/typescript
- FastAPI features and OpenAPI support: https://fastapi.tiangolo.com/features/
- PostgreSQL full-text search: https://www.postgresql.org/docs/current/textsearch.html
- WCAG 2.2 Recommendation: https://www.w3.org/TR/WCAG22/
- OWASP ASVS 5.0.0: https://owasp.org/www-project-application-security-verification-standard/
