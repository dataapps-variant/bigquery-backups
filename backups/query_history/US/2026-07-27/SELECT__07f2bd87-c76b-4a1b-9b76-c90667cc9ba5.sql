-- job_id: 07f2bd87-c76b-4a1b-9b76-c90667cc9ba5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T22:02:17.592000+00:00
-- started: 2026-07-27T22:02:17.719000+00:00
-- ended: 2026-07-27T22:02:18.020000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
