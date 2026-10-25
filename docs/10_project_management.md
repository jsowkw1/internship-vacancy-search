# Project Management, Responsibilities, and Risks

## Proposed responsibility split

The division below is a proposal because the team did not provide confirmed assignments. Each student should use an individual account and identifiable commit author details. Both students should review one another's significant changes.

| Student | Proposed primary area | Shared responsibilities |
|---|---|---|
| Жиенбек Муслим Рахымжанұлы | Backend/API, data model, authorization, deployment and technical decisions | Interviews, architecture review, documentation, code review, evaluation |
| Сағым Мұхаммеджан Бақытжанұлы | UX/frontend, search interactions, accessibility and usability materials | Interviews, architecture review, documentation, code review, evaluation |

Confirm this split and reassign any task before creating real tracker issues.

## Relative milestone plan

| Milestone | Planned window | Deliverables and exit condition | Owner |
|---|---|---|---|
| M1. Validate need and scope | Week 1 | 3-5 interview records or client agreement; revised problem statement and scope | Both; confirm |
| M2. Freeze requirements and architecture | Week 2 | Accepted requirements, criteria, diagrams, technology decision record | Both; supervisor review |
| M3. Build catalogue foundation | Weeks 3-4 | Schema, roles, listing lifecycle, seed dataset with provenance | Proposed backend owner |
| M4. Implement search and profile | Weeks 5-6 | Search/filter API and UI; shortlist and fit explanation | Shared; confirm |
| M5. Add employer/moderation flows | Week 7 | Pending submission, moderation, expiry, audit trail | Proposed backend owner + moderator UX |
| M6. Stabilize accessibility and security | Week 8 | Manual checklist, defect list, resolved critical issues | Both |
| M7. Evaluate with target users | Week 9 | Task study, retrieval benchmark, baseline comparison, findings | Both; supervisor approval |
| M8. Finalize thesis and demo | Week 10 | Updated report, tagged release, known limitations, demo script | Both; supervisor review |

Weeks are relative and must be aligned with the official academic calendar and supervisor checkpoints. They are not committed due dates.

## Git and review workflow

1. Create one team repository on GitHub or GitLab and invite both students, supervisor, and committee accounts as required.
2. Keep `main` as the reviewed baseline. Use feature branches named `<ISSUE-ID>-short-description`.
3. Create one YouTrack issue per meaningful deliverable with an owner, outcome, acceptance criteria, and due date.
4. Include the issue ID in branch, commit, and pull/merge request. Link the pull/merge request back to the issue.
5. Commit coherent changes progressively, including documentation and diagrams. Do not upload the entire project only at a checkpoint.
6. Require a review by the other student; for major individual work, ask the supervisor to review selected changes.
7. Tag submitted states `pre-defense-1`, `pre-defense-2`, and `final-pre-defense`; do not move earlier tags.
8. For each checkpoint, record repository URL, tag, completed work, known limits, open tasks, and access confirmation.

No external repo, issue IDs, task assignments, reviews, tags, or commit history were provided; these are setup instructions, not proof that the workflow has already occurred.

## Risk register

| Risk | Probability / impact | Mitigation | Owner |
|---|---|---|---|
| Interviews do not confirm the fragmentation problem | Medium / High | Test the problem before building; narrow or change the proposition using evidence | Both |
| External listing access is unavailable or prohibited | High / High | Start with employer-submitted and permissioned seed data; no scraping; record data provenance | Proposed backend owner |
| Listings are stale, duplicated, or misleading | High / High | Require source and expiry; moderator review; report and archive workflow | Both |
| Little or no labeled matching data | High / Medium | Begin with explicit filters and rule-based explainable match; defer learned ranking | Both |
| Search scores encode unfair proxies | Medium / High | Do not use protected attributes; expose criteria; test controlled profiles and errors | Both |
| Kazakh/Russian synonyms and morphology reduce search quality | Medium / Medium | Maintain curated aliases; test with bilingual scenarios; document unsupported query cases | Proposed frontend + backend owners |
| Scope exceeds team capacity | Medium / High | Keep MVP narrow; defer CV parsing, employer applicant ranking, microservices, and scraping | Both + supervisor |
| Team commits are not individually attributable | Medium / Medium | Individual accounts, author identity, issue-linked branches and code review | Each student |
| Supervisor feedback arrives late | Medium / High | Agree review checkpoints in Week 2; share concise deliverables early | Both |
| Personal data is collected unnecessarily | Low / High | No CV upload in MVP; minimize profile fields; remove participant identifiers | Both |

## YouTrack task set to create

Create real issues after setting up the project. Suggested tasks: validate problem with interviews; approve requirements; approve architecture/stack; implement catalogue and lifecycle; implement search and filters; implement profile and saved items; implement moderation; complete accessibility/security review; run benchmark and usability study; finalize report and pre-defense tag. Copy each acceptance criterion from the corresponding document. Do not use this list as evidence that issues already exist.
