-- job_id: sheets_dataconnector_0d25281a-04ce-4cdc-8a80-21f44e5c6348
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:15:01.643000+00:00
-- started: 2026-07-28T18:15:01.866000+00:00
-- ended: 2026-07-28T18:15:02.202000+00:00

 SELECT creation_time AS `creation_time`, last_modified_time AS `last_modified_time`, row_count AS `row_count`, size_bytes AS `size_bytes`
 FROM 
`variant-finance-data-project`.`Ad_spend_data`.`__TABLES__` AS `baseQuery`
  WHERE ((UPPER(IFNULL(`table_id`, '')) IN (UPPER('Spend_Matching_Channel'))))
