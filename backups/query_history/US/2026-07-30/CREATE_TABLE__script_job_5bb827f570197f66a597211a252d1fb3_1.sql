-- job_id: script_job_5bb827f570197f66a597211a252d1fb3_1
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE
-- created: 2026-07-30T22:39:35.155000+00:00
-- started: 2026-07-30T22:39:35.250000+00:00
-- ended: 2026-07-30T22:39:35.375000+00:00

CREATE TABLE `variant-finance-data-project`.`Sticky_Data`.`test20260730ocnqy` (
  _airbyte_raw_id STRING NOT NULL,
  _airbyte_extracted_at TIMESTAMP NOT NULL,
  _airbyte_meta JSON NOT NULL,
  _airbyte_generation_id INTEGER,
  `test` INT64
)
PARTITION BY (DATE_TRUNC(_airbyte_extracted_at, DAY))
CLUSTER BY `_airbyte_extracted_at`
