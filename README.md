# Internship and Vacancy Search Project

**Diploma project:** Development of a Web Application for Searching Internships and Job Vacancies  
**Russian:** Разработка веб-приложения для поиска стажировок и вакансий  
**Kazakh:** Тағылымдамалар мен бос жұмыс орындарын іздеуге арналған веб-қосымшаны әзірлеу

Team: Жиенбек Муслим Рахымжанұлы and Сағым Мұхаммеджан Бақытжанұлы (SE-2427).  
Supervisor: Хармысов Чингис Аблайханович.  
Package status: **pre-defense draft, 25 October 2026**.

## What is here

- `project_report.docx` and `project_report.pdf`: unified report covering all 11 assessment components.
- `docs/`: editable proposal, interview guide, literature matrix, system and technology comparisons, requirements, architecture, evaluation plan, project plan, feedback form, and submission checklist.
- `prototype/index.html`: interactive, local-only UX prototype. All displayed vacancies are fictional demo records.
- `docs/architecture/*.mmd`: editable Mermaid diagram sources.

## Selected technologies

React + TypeScript (frontend), FastAPI (backend REST API), PostgreSQL (storage and full-text search), deployed as a modular monolith. Justification: `docs/05_technology_comparison.md`.

## Repository structure

| Path | Contents |
|---|---|
| `docs/` | Proposal, research, literature review, comparisons, requirements, architecture, evaluation plan, project management |
| `docs/architecture/` | Editable Mermaid diagram sources; PNG exports in `report_assets/` |
| `prototype/` | Clickable UX prototype |
| `src/backend/`, `src/frontend/` | Application code (added from task DIP-9) |
| `tests/` | Automated tests and evaluation materials |
| `config/` | Configuration examples with placeholder values (`.env.example`) |

## Links

- YouTrack project: https://jsowkw1.youtrack.cloud/projects/DIP (tasks DIP-1…DIP-17; offline copy: `docs/youtrack_backlog.csv`)
- Repository: https://github.com/jsowkw1/internship-vacancy-search

## Open the prototype

Open `prototype/index.html` in a browser. Search, filters, sorting, detail views, and saved items work locally in the browser. No account, backend, live listings, or real applications are connected.

## Project status and evidence

The team and topic are taken from the supplied approval documents; the supervisor name follows the team's clarification. The materials do not claim that user interviews, a client agreement, a GitHub/GitLab repository, a YouTrack project, supervisor review, or team role assignments already exist. Ready-to-fill templates and a proposed role split are included. Interview findings and review feedback must be added after they happen.

The project problem is currently a **hypothesis**: early-career applicants may need to search across fragmented sources and compare opportunities with inconsistent fields. Official service materials show that some major platforms already support student or internship flows, recommendations, alerts, or aggregated listings. The proposal therefore treats differentiation as unvalidated and focuses on a common early-career search experience, normalized filters, source attribution, and explainable matching.

## Proposed implementation scope

The MVP is a modular web application for students and recent graduates in Kazakhstan. It will provide a normalized catalogue of authorized or employer-submitted opportunities, structured search, filters, detail pages, saved listings, an employer submission flow, moderation, and an explainable rule-based fit indicator. The first academic prototype uses fictional seed data. It does not scrape job boards, parse CVs, make hiring decisions, or claim live vacancy coverage.

## Next actions before external submission

1. Conduct and document 3-5 short discussions with target users, or obtain and record a substantive client agreement.
2. Confirm the proposed member responsibilities and the 10-week milestone plan with the supervisor.
3. Invite the second team member and the supervisor to the GitHub repository and YouTrack project.
4. Ask the supervisor to review the key decisions and complete the feedback form.
5. Replace fictional prototype listings with a clearly labelled authorized dataset before any public demonstration.
6. Capture the required YouTrack screenshots into a single PDF and upload it alongside the unified report using the institution's form.

## Starting a local preview

The prototype can be opened directly. For consistent browser storage, run a static server from this directory:

```powershell
python -m http.server 8000 --directory prototype
```

Then open `http://localhost:8000`.

## Repository setup

This folder is a ready-to-publish project scaffold; it has no remote repository or fabricated commit history. Create a private or public repository under a team-owned account, give the supervisor and committee the access they require, then push this folder. Add real YouTrack issue IDs to task branches and commits as described in `docs/10_project_management.md`.
