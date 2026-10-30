-- Initial PostgreSQL schema for the internship and vacancy search MVP (task DIP-8).
-- Follows the domain model in docs/06_requirements.md. No CV files or sensitive attributes are stored (NFR-04).

CREATE TYPE user_role AS ENUM ('job_seeker', 'employer', 'moderator', 'admin');
CREATE TYPE opportunity_type AS ENUM ('internship', 'entry_level', 'part_time', 'full_time');
CREATE TYPE opportunity_status AS ENUM ('draft', 'pending', 'published', 'rejected', 'expired', 'archived');
CREATE TYPE work_arrangement AS ENUM ('onsite', 'remote', 'hybrid');
CREATE TYPE report_status AS ENUM ('open', 'resolved', 'dismissed');

CREATE TABLE app_user (
    id            BIGSERIAL PRIMARY KEY,
    email         VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,          -- modern hash (argon2/bcrypt), never plain text (NFR-03)
    role          user_role    NOT NULL DEFAULT 'job_seeker',
    created_at    TIMESTAMPTZ  NOT NULL DEFAULT now()
);

CREATE TABLE job_seeker_profile (
    user_id           BIGINT PRIMARY KEY REFERENCES app_user (id) ON DELETE CASCADE,
    education_stage   VARCHAR(50),                -- e.g. 'year_3', 'graduate'
    city              VARCHAR(100),
    work_arrangement  work_arrangement,
    desired_type      opportunity_type,
    updated_at        TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE employer (
    id         BIGSERIAL PRIMARY KEY,
    owner_id   BIGINT REFERENCES app_user (id) ON DELETE SET NULL,
    name       VARCHAR(255) NOT NULL,
    website    VARCHAR(500),
    verified   BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE source (
    id           BIGSERIAL PRIMARY KEY,
    label        VARCHAR(255) NOT NULL,           -- shown to users for attribution (NFR-06)
    base_url     VARCHAR(500),
    permission   TEXT NOT NULL                    -- how the listing may be used: employer submission, API terms, written consent
);

CREATE TABLE opportunity (
    id               BIGSERIAL PRIMARY KEY,
    employer_id      BIGINT NOT NULL REFERENCES employer (id),
    source_id        BIGINT NOT NULL REFERENCES source (id),
    title            VARCHAR(255) NOT NULL,
    description      TEXT NOT NULL,
    type             opportunity_type NOT NULL,
    experience_level VARCHAR(50),                 -- 'no_experience', 'under_1_year', ...
    city             VARCHAR(100),
    work_arrangement work_arrangement,
    schedule         VARCHAR(50),
    salary_min       INTEGER CHECK (salary_min >= 0),
    salary_max       INTEGER,
    language         VARCHAR(10),                 -- 'ru', 'kk', 'en'
    source_url       VARCHAR(1000) NOT NULL,      -- original application destination (FR-05)
    status           opportunity_status NOT NULL DEFAULT 'pending',
    published_at     TIMESTAMPTZ,
    expires_at       TIMESTAMPTZ NOT NULL,
    last_verified_at TIMESTAMPTZ,
    created_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
    search_vector    TSVECTOR GENERATED ALWAYS AS (
        to_tsvector('simple', coalesce(title, '') || ' ' || coalesce(description, ''))
    ) STORED,
    CHECK (salary_max IS NULL OR salary_min IS NULL OR salary_max >= salary_min)
);

CREATE INDEX opportunity_search_idx ON opportunity USING GIN (search_vector);
CREATE INDEX opportunity_public_idx ON opportunity (status, expires_at);
-- FR-11: flag possible duplicates of an active listing with the same source URL
CREATE UNIQUE INDEX opportunity_active_source_url_idx
    ON opportunity (source_url) WHERE status IN ('pending', 'published');

CREATE TABLE skill (
    id      BIGSERIAL PRIMARY KEY,
    name    VARCHAR(100) NOT NULL UNIQUE,
    aliases TEXT[] NOT NULL DEFAULT '{}'          -- ru/kk/en synonyms for search
);

CREATE TABLE opportunity_skill (
    opportunity_id BIGINT REFERENCES opportunity (id) ON DELETE CASCADE,
    skill_id       BIGINT REFERENCES skill (id),
    required       BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY (opportunity_id, skill_id)
);

CREATE TABLE profile_skill (
    user_id  BIGINT REFERENCES job_seeker_profile (user_id) ON DELETE CASCADE,
    skill_id BIGINT REFERENCES skill (id),
    PRIMARY KEY (user_id, skill_id)
);

CREATE TABLE saved_opportunity (
    user_id        BIGINT REFERENCES app_user (id) ON DELETE CASCADE,
    opportunity_id BIGINT REFERENCES opportunity (id) ON DELETE CASCADE,
    saved_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (user_id, opportunity_id)         -- FR-06: private shortlist per user
);

CREATE TABLE moderation_event (
    id             BIGSERIAL PRIMARY KEY,
    opportunity_id BIGINT NOT NULL REFERENCES opportunity (id),
    actor_id       BIGINT NOT NULL REFERENCES app_user (id),
    from_status    opportunity_status,
    to_status      opportunity_status NOT NULL,
    reason         TEXT NOT NULL,                 -- FR-10: actor, time and reason for every change
    created_at     TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE report (
    id             BIGSERIAL PRIMARY KEY,
    opportunity_id BIGINT NOT NULL REFERENCES opportunity (id) ON DELETE CASCADE,
    reporter_id    BIGINT REFERENCES app_user (id) ON DELETE SET NULL,
    reason         TEXT NOT NULL,
    status         report_status NOT NULL DEFAULT 'open',
    created_at     TIMESTAMPTZ NOT NULL DEFAULT now()
);
