-- job_id: script_job_2f0b22a096ea59dbf176c899bf41e7e5_1
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE
-- created: 2026-07-29T15:11:05.965000+00:00
-- started: 2026-07-29T15:11:06.074000+00:00
-- ended: 2026-07-29T15:11:06.201000+00:00

CREATE TABLE `variant-finance-data-project`.`Sticky_Data`.`test20260729yelmd` (
  _airbyte_raw_id STRING NOT NULL,
  _airbyte_extracted_at TIMESTAMP NOT NULL,
  _airbyte_meta JSON NOT NULL,
  _airbyte_generation_id INTEGER,
  `test` INT64
)
PARTITION BY (DATE_TRUNC(_airbyte_extracted_at, DAY))
CLUSTER BY `_airbyte_extracted_at`
