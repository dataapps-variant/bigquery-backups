-- job_id: 9e488c77-dc81-4377-aa39-7f029acc386e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T21:02:14.836000+00:00
-- started: 2026-07-30T21:02:15.016000+00:00
-- ended: 2026-07-30T21:02:15.139000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
