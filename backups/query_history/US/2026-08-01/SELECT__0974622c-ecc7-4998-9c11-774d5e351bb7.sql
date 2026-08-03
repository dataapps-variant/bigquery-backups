-- job_id: 0974622c-ecc7-4998-9c11-774d5e351bb7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T13:06:04.999000+00:00
-- started: 2026-08-01T13:06:05.122000+00:00
-- ended: 2026-08-01T13:06:05.238000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
