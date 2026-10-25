# Requirements Specification

## User roles

- Visitor: browse and search public listings.
- Job seeker: manage a minimal profile and save listings.
- Employer: submit and maintain its own listings.
- Moderator: review, publish, reject, expire, or archive listings.
- Administrator: manage users, taxonomies, access, and audit records.

## Functional requirements and acceptance criteria

| ID | Requirement | Priority | Acceptance criterion |
|---|---|---|---|
| FR-01 | Display active published opportunities with title, employer, location, type, experience, publication date, source, and expiry | Must | A published active record appears with all supplied fields; missing optional fields are marked “Not specified” rather than fabricated |
| FR-02 | Search by title, company, description keyword, and skill | Must | A query returns only active records matching the documented lexical rule; clearing the query restores the unfiltered result set |
| FR-03 | Filter by internship/entry-level, city/remote, schedule, experience, and salary range when supplied | Must | Each filter can be combined; resetting filters restores the prior search query and all matching records |
| FR-04 | Sort by relevance rules and newest publication date | Must | The selected order is visible and deterministic for identical data and query |
| FR-05 | Show listing details and original application/source link | Must | Opening a card shows all available fields and a clearly labelled external destination; no unknown destination is invented |
| FR-06 | Save and remove listings from a personal shortlist | Should | A signed-in user can add/remove a listing; saved state persists after logout/login and does not leak to another user |
| FR-07 | Create a minimal early-career profile with skills, education stage, city, work arrangement, and desired type | Should | A user can create and edit only the listed fields; saving validates required values |
| FR-08 | Show a transparent fit breakdown for a jobseeker profile | Should | The card shows matched and missing optional criteria; the explanation is reproducible from recorded rules; it is labelled advisory, not a hiring decision |
| FR-09 | Allow employers to submit a listing | Should | A valid submission is stored as pending and is not visible publicly before moderator approval |
| FR-10 | Allow moderators to approve, reject, edit, expire, and archive records | Must | Every status change records actor, time, and reason; expired records are not returned in public search |
| FR-11 | Prevent duplicate active listings using source URL and normalized title/employer/date checks | Should | A suspected duplicate is flagged for moderator review; the system never silently deletes the candidate record |
| FR-12 | Provide Russian and Kazakh interface text | Should | Core navigation, search, forms, filters, empty states, errors, and accessibility labels are localized; untranslated text is flagged before release |
| FR-13 | Report a listing as incorrect or suspicious | Could | A report creates a moderation queue item without exposing the reporter's private details publicly |

## Non-functional requirements

| ID | Requirement | Priority | Acceptance criterion |
|---|---|---|---|
| NFR-01 | Search responsiveness | Must | On the declared test environment with 10,000 seed records and 50 concurrent sessions, 95th-percentile search response is under 2 seconds; publish the environment and result |
| NFR-02 | Accessibility | Must | Core search and save flows meet WCAG 2.2 AA checks for keyboard access, visible focus, labels, contrast, error identification, and reflow; manual results are recorded |
| NFR-03 | Security | Must | Role checks are enforced server-side; secrets are not committed; passwords use a modern password hash; core checks are mapped to OWASP ASVS 5.0 |
| NFR-04 | Data minimization | Must | The MVP does not ingest CV files or sensitive attributes; users can delete their profile and saved data in the demonstration environment |
| NFR-05 | Responsive layout | Must | At 360px, 768px, and 1440px viewport widths, core flows remain usable without horizontal scrolling |
| NFR-06 | Listing freshness | Must | Every listing displays a source and last-verified or expiry date; expired listings cannot be applied to from the catalogue |
| NFR-07 | Maintainability | Should | API contracts are documented through OpenAPI; modules and schema changes are documented; repository README includes setup instructions |
| NFR-08 | Reliability of matching | Must | No protected characteristic is used in matching; each score component is visible and can be switched off independently |

## Matching rules (initial, explainable baseline)

1. Hard constraints: listing is active, the requested opportunity type matches, and any explicitly required location/work arrangement is compatible.
2. Optional points: 40% skill overlap, 25% experience-level fit, 20% location/work arrangement fit, and 15% schedule/salary preference fit. Weights are initial design parameters, not empirically optimal weights.
3. Display the component values and missing data. If profile or listing attributes are absent, show “not enough information”; do not treat missing as a negative skill.
4. Do not use gender, age, ethnicity, disability, or inferred proxies. Matching is an aid for the jobseeker and must not rank applicants for employers.
5. Calibrate or remove the score after user tests if participants find it misleading.

## Domain model (minimum)

`User`, `JobSeekerProfile`, `Employer`, `Opportunity`, `Skill`, `OpportunitySkill`, `SavedOpportunity`, `Source`, `ModerationEvent`, and `Report`. `Opportunity.status` uses `draft`, `pending`, `published`, `rejected`, `expired`, and `archived`. A listing stores both normalized display fields and the original source URL/label.
