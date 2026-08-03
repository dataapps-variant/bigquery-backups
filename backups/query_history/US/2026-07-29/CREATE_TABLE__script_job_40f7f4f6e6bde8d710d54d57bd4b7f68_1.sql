-- job_id: script_job_40f7f4f6e6bde8d710d54d57bd4b7f68_1
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE
-- created: 2026-07-29T16:09:29.542000+00:00
-- started: 2026-07-29T16:09:29.665000+00:00
-- ended: 2026-07-29T16:09:29.794000+00:00

CREATE TABLE `variant-finance-data-project`.`Sticky_Data`.`test20260729sehhj` (
  _airbyte_raw_id STRING NOT NULL,
  _airbyte_extracted_at TIMESTAMP NOT NULL,
  _airbyte_meta JSON NOT NULL,
  _airbyte_generation_id INTEGER,
  `test` INT64
)
PARTITION BY (DATE_TRUNC(_airbyte_extracted_at, DAY))
CLUSTER BY `_airbyte_extracted_at`
