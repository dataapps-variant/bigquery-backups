-- job_id: job_N5UyZQLU9tLP6EQbuanODJ5PZGB7
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SCRIPT
-- created: 2026-07-30T22:39:34.682000+00:00
-- started: 2026-07-30T22:39:34.715000+00:00
-- ended: 2026-07-30T22:39:35.444000+00:00

DROP TABLE IF EXISTS `variant-finance-data-project`.`Sticky_Data`.`test20260730ocnqy`;
CREATE TABLE `variant-finance-data-project`.`Sticky_Data`.`test20260730ocnqy` (
  _airbyte_raw_id STRING NOT NULL,
  _airbyte_extracted_at TIMESTAMP NOT NULL,
  _airbyte_meta JSON NOT NULL,
  _airbyte_generation_id INTEGER,
  `test` INT64
)
PARTITION BY (DATE_TRUNC(_airbyte_extracted_at, DAY))
CLUSTER BY `_airbyte_extracted_at`;
