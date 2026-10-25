# Project Proposal

## Approved topic

- English: **Development of a Web Application for Searching Internships and Job Vacancies**
- Russian: **Разработка веб-приложения для поиска стажировок и вакансий**
- Kazakh: **Тағылымдамалар мен бос жұмыс орындарын іздеуге арналған веб-қосымшаны әзірлеу**

## Team and supervision

| Item | Value |
|---|---|
| Students | Жиенбек Муслим Рахымжанұлы; Сағым Мұхаммеджан Бақытжанұлы |
| Group | SE-2427 |
| Supervisor | Хармысов Чингис Аблайханович |
| GitHub | https://github.com/jsowkw1/internship-vacancy-search |
| YouTrack | https://jsowkw1.youtrack.cloud/projects/DIP |

## Problem statement

Students and recent graduates may have to search for internships and entry-level vacancies across multiple services whose records use different categories, labels, and application routes. This creates a possible cost in repeated searching and makes it harder to compare opportunities by experience level, location, schedule, skills, and source. This statement is a working hypothesis based on the team's topic rationale; it has not yet been validated through interviews or client data.

## Target users and stakeholders

- Primary users: university students and recent graduates in Kazakhstan who are looking for internships or early-career work.
- Secondary users: employers who submit opportunities and moderators who check records for completeness, duplication, legitimacy, and expiry.
- Academic stakeholders: the project team, supervisor, and pre-defense committee.

## Aim

Design and implement a web application prototype that helps students and recent graduates discover, compare, and save authorized internship and entry-level opportunities through consistent search fields and an explainable fit indicator.

## Objectives

1. Validate the problem and requirements with 3-5 target-user discussions or a documented client agreement.
2. Review job-recommendation and fair-recommendation research and compare existing services using consistent criteria.
3. Define measurable functional and non-functional requirements and acceptance criteria.
4. Design the data model, API, system context, use cases, and component architecture.
5. Build an accessible UX prototype and a small full-stack MVP using authorized or employer-submitted listings.
6. Evaluate retrieval quality, task completion, usability, accessibility, and performance against a declared baseline.
7. Maintain traceable team contributions, tasks, reviews, risks, and supervisor feedback in Git and YouTrack.

## Expected outcomes

- Requirements and acceptance criteria grounded in evidence and separated from assumptions.
- Annotated literature review with at least 12 meaningfully used sources, including at least 8 scientific publications.
- Comparison of 4 existing systems and 3 technical decisions.
- A modular web application with a vacancy catalogue, structured filtering, vacancy details, saved items, employer submissions, moderation, and a transparent rule-based match explanation.
- Editable diagrams, a local UX prototype, a test and evaluation plan, and project documentation.
- A reproducible repository and task history in GitHub and YouTrack.

## Scope

### Included in the proposed MVP

- Catalogue of published opportunities with source, publication date, expiry date, employment type, experience level, location, schedule, skills, language, and application URL.
- Search by title, company, keyword, and skill; filters for internship/entry-level, city/remote, schedule, experience, and salary when provided.
- Sort by relevance rules or recency; show why a record matched.
- Save listings to a signed-in user's shortlist.
- Employer submission form and moderator review; expired records are archived.
- Russian and Kazakh interface text, responsive layout, and keyboard-accessible core flows.

### Excluded from the first MVP

- Unapproved scraping or automated copying from third-party job boards.
- Automated CV parsing, hiring decisions, candidate ranking for employers, or black-box AI scores.
- Guaranteed completeness of Kazakhstan's job market or live integration with any platform.
- A production-scale recommendation model; no interaction dataset or validated labels are available.

## Proposed novelty and engineering contribution

The project does not claim to invent vacancy search or recommendation. Existing services already provide relevant features. The proposed contribution to validate is a student-centered workflow that uses consistent early-career fields across authorized listings, shows the source and freshness of each record, and explains a simple match score using explicit preferences. Interviews and the competitor study must determine whether this is useful enough to justify a separate application.
