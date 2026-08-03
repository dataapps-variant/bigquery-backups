-- job_id: job_jyKCZMLvFN_tTiklWZffLkV0M0NR
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SCRIPT
-- created: 2026-07-29T16:09:29.012000+00:00
-- started: 2026-07-29T16:09:29.045000+00:00
-- ended: 2026-07-29T16:09:29.875000+00:00

DROP TABLE IF EXISTS `variant-finance-data-project`.`Sticky_Data`.`test20260729sehhj`;
CREATE TABLE `variant-finance-data-project`.`Sticky_Data`.`test20260729sehhj` (
  _airbyte_raw_id STRING NOT NULL,
  _airbyte_extracted_at TIMESTAMP NOT NULL,
  _airbyte_meta JSON NOT NULL,
  _airbyte_generation_id INTEGER,
  `test` INT64
)
PARTITION BY (DATE_TRUNC(_airbyte_extracted_at, DAY))
CLUSTER BY `_airbyte_extracted_at`;
