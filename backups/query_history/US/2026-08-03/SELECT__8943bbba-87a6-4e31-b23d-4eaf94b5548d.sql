-- job_id: 8943bbba-87a6-4e31-b23d-4eaf94b5548d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T05:03:54.415000+00:00
-- started: 2026-08-03T05:03:54.507000+00:00
-- ended: 2026-08-03T05:03:54.642000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
