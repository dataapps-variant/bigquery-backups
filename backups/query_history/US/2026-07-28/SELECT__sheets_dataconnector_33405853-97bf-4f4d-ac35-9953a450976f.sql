-- job_id: sheets_dataconnector_33405853-97bf-4f4d-ac35-9953a450976f
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T17:37:46.270000+00:00
-- started: 2026-07-28T17:37:46.463000+00:00
-- ended: 2026-07-28T17:37:46.789000+00:00

 SELECT creation_time AS `creation_time`, last_modified_time AS `last_modified_time`, row_count AS `row_count`, size_bytes AS `size_bytes`
 FROM 
`variant-finance-data-project`.`Ad_spend_data`.`__TABLES__` AS `baseQuery`
  WHERE ((UPPER(IFNULL(`table_id`, '')) IN (UPPER('Spend_Matching_Channel'))))
