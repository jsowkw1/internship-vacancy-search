# UX Prototype

## Status

`prototype/index.html` is a local interactive mock-up with fictional sample listings. It demonstrates key user flows, not an implemented or connected production service.

## Scenarios

1. **Discover an internship:** the visitor searches “frontend”, selects Internship and Astana, and sees only matching active demo records.
2. **Check fit:** the jobseeker opens a card, sees required skills and an explicit fit breakdown, and can distinguish missing information from a mismatch.
3. **Save and compare:** the jobseeker bookmarks a record and switches to the saved filter; the browser stores this state locally.
4. **Verify a source:** the user sees a source label and freshness marker before leaving for the employer's original page. Demo records do not provide an application destination.

## Interaction and accessibility notes

- Search and filters have visible labels and work with keyboard controls.
- Cards use semantic headings and buttons; save state is announced through button text.
- Color is not the sole indicator of match or status.
- Demo records are visibly labeled as fictional so nobody mistakes them for active vacancies.
- The current prototype is Russian-only. Kazakh localization is required for the MVP and still needs translation and review.

## Missing validation

No participant walkthrough has been conducted. Use the evaluation protocol in `09_evaluation_plan.md`, observe task success without coaching, and update the wireflow after recording issues.
