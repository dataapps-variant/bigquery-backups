-- job_id: 2bd92236-1f89-4910-8b15-c06e0fe975dc
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T21:08:14.590000+00:00
-- started: 2026-07-27T21:08:14.692000+00:00
-- ended: 2026-07-27T21:08:14.833000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
