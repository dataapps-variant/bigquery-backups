-- job_id: 7e8bfaf8-1560-48e2-aaa3-f6344cd9fe11
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T14:03:01.880000+00:00
-- started: 2026-07-31T14:03:02.012000+00:00
-- ended: 2026-07-31T14:03:02.363000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
