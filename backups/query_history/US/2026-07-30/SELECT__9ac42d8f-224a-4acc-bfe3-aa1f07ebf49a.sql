-- job_id: 9ac42d8f-224a-4acc-bfe3-aa1f07ebf49a
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:42:43.594000+00:00
-- started: 2026-07-30T12:42:43.725000+00:00
-- ended: 2026-07-30T12:42:44.065000+00:00


SELECT table_schema, table_name, STRING_AGG(column_name ORDER BY ordinal_position) cols
FROM `variant-finance-data-project`.`region-us`.INFORMATION_SCHEMA.COLUMNS
WHERE LOWER(column_name) LIKE '%afid%'
GROUP BY 1,2
HAVING LOWER(cols) LIKE '%country%'
ORDER BY 1,2
