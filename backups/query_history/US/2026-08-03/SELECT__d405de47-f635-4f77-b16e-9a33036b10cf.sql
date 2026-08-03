-- job_id: d405de47-f635-4f77-b16e-9a33036b10cf
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:03:04.581000+00:00
-- started: 2026-08-03T12:03:04.687000+00:00
-- ended: 2026-08-03T12:03:04.830000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
