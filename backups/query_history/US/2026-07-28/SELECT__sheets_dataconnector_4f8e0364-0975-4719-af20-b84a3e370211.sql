-- job_id: sheets_dataconnector_4f8e0364-0975-4719-af20-b84a3e370211
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T17:18:41.456000+00:00
-- started: 2026-07-28T17:18:41.637000+00:00
-- ended: 2026-07-28T17:18:50.407000+00:00

 SELECT creation_time AS `creation_time`, last_modified_time AS `last_modified_time`, row_count AS `row_count`, size_bytes AS `size_bytes`
 FROM 
`variant-finance-data-project`.`Ad_spend_data`.`__TABLES__` AS `baseQuery`
  WHERE ((UPPER(IFNULL(`table_id`, '')) IN (UPPER('Spend_Matching_Channel'))))
