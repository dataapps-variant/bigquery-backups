-- job_id: sheets_dataconnector_1ff7692c-e044-410d-835e-16a6d80b8c03
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T17:37:45.300000+00:00
-- started: 2026-07-28T17:37:45.602000+00:00
-- ended: 2026-07-28T17:37:45.904000+00:00

 SELECT creation_time AS `creation_time`, last_modified_time AS `last_modified_time`, row_count AS `row_count`, size_bytes AS `size_bytes`
 FROM 
`variant-finance-data-project`.`Ad_spend_data`.`__TABLES__` AS `baseQuery`
  WHERE ((UPPER(IFNULL(`table_id`, '')) IN (UPPER('Spend_Matching_Channel'))))
