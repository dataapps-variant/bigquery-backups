-- job_id: a9b1cbbf-e542-4ceb-81aa-c2d8a9b9d0a4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T17:02:03.894000+00:00
-- started: 2026-07-27T17:02:04.002000+00:00
-- ended: 2026-07-27T17:02:04.195000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
