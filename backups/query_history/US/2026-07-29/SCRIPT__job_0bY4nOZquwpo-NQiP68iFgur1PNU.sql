-- job_id: job_0bY4nOZquwpo-NQiP68iFgur1PNU
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SCRIPT
-- created: 2026-07-29T15:11:05.460000+00:00
-- started: 2026-07-29T15:11:05.503000+00:00
-- ended: 2026-07-29T15:11:06.296000+00:00

DROP TABLE IF EXISTS `variant-finance-data-project`.`Sticky_Data`.`test20260729yelmd`;
CREATE TABLE `variant-finance-data-project`.`Sticky_Data`.`test20260729yelmd` (
  _airbyte_raw_id STRING NOT NULL,
  _airbyte_extracted_at TIMESTAMP NOT NULL,
  _airbyte_meta JSON NOT NULL,
  _airbyte_generation_id INTEGER,
  `test` INT64
)
PARTITION BY (DATE_TRUNC(_airbyte_extracted_at, DAY))
CLUSTER BY `_airbyte_extracted_at`;
