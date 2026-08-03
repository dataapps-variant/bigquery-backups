-- job_id: sheets_dataconnector_98d85b9a-e8a8-426e-8671-98630eabd2e3
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T17:18:40.642000+00:00
-- started: 2026-07-28T17:18:40.815000+00:00
-- ended: 2026-07-28T17:18:50.412000+00:00

 SELECT creation_time AS `creation_time`, last_modified_time AS `last_modified_time`, row_count AS `row_count`, size_bytes AS `size_bytes`
 FROM 
`variant-finance-data-project`.`Ad_spend_data`.`__TABLES__` AS `baseQuery`
  WHERE ((UPPER(IFNULL(`table_id`, '')) IN (UPPER('Spend_Matching_Channel'))))
