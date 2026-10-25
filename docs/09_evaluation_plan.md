# Verification and Evaluation Plan

## Research questions

- RQ1: Can target users find an internship or entry-level vacancy matching explicit constraints more quickly than with a manual multi-site search?
- RQ2: Are the normalized fields and fit breakdown understandable and useful?
- RQ3: Do search results retrieve the relevant opportunities without hiding eligible alternatives?
- RQ4: Does the responsive core flow meet the declared accessibility and performance targets?

## Evaluation phases

| Phase | Participants/data | Procedure | Measures | Status |
|---|---|---|---|---|
| Problem discovery | 3-5 students/recent graduates | Semi-structured interviews using `02_relevance_and_user_research.md` | Repeated needs, workarounds, counterexamples; anonymized notes | Not done |
| Retrieval benchmark | At least 30 fictional or authorized opportunities; 10 search scenarios reviewed by two team members | Label relevant/not relevant for each scenario before testing search | Precision@10, Recall@10, nDCG@10, zero-result rate; report sample and labeling agreement | Planned |
| Comparative task study | 5-8 target users, subject to supervisor approval | Counterbalanced tasks on the prototype and current services; same target criteria; no personal accounts required | Task success, time, query reformulations, wrong/expired listings, 5-point ease and trust ratings | Planned |
| Technical verification | Declared seed dataset and test environment | Run functional checks, accessibility review, and load profile | Search p95, error rate, keyboard completion, WCAG 2.2 AA checklist | Planned |

## Baseline

Baseline: each participant manually searches Enbek.kz and one other service of their choice using the same target (for example, a part-time software internship in Astana with no experience requirement). The team records the services, query, filters, date/time, result counts, and selected item. Compare the prototype against this baseline; do not compare ranking quality until target users confirm the task represents their actual search.

## Measurement conditions

- Use identical target criteria and time windows; record the exact date because vacancy inventories change.
- Use only public pages and demo accounts approved by participants; do not collect passwords or upload CVs.
- Randomize task order to reduce learning effects.
- Define “relevant” before evaluating retrieval and have two reviewers label the benchmark independently.
- Keep benchmark records fictional or permissioned; record source and expiry for every real listing.
- Report all participant counts, missing observations, and results that contradict the hypothesis.

## Acceptance gates

- At least 80% task completion for the 4 core prototype tasks in the planned small usability study; if the sample is under 5, report counts, not percentages alone.
- Search benchmark reaches a team-agreed target of Precision@10 >= 0.70 and Recall@10 >= 0.80 on the declared small dataset; treat these as project targets, not expected results.
- 95th-percentile search response <2 seconds for 10,000 seed records and 50 concurrent sessions on a documented environment.
- No critical keyboard blocker in search, details, save, or filter reset; all core form controls have programmatic labels.
- Every public listing has source attribution and an expiry or last-verified date; no expired listing remains discoverable.

## Reporting template

| Scenario / metric | Baseline | Prototype | Difference | Sample / conditions | Result / interpretation |
|---|---:|---:|---:|---|---|
| Median task time | TBD | TBD | TBD | N, date, scenario | TBD |
| Task success | TBD | TBD | TBD | N, task | TBD |
| Precision@10 | TBD | TBD | TBD | Queries and relevance labels | TBD |
| Recall@10 | TBD | TBD | TBD | Queries and relevance labels | TBD |
| Search p95 | N/A | TBD | N/A | Hardware, dataset, concurrent sessions | TBD |
| Keyboard blockers | TBD | TBD | TBD | Checklist version | TBD |
