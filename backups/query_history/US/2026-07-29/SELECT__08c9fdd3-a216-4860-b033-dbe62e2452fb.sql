-- job_id: 08c9fdd3-a216-4860-b033-dbe62e2452fb
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:07:24.972000+00:00
-- started: 2026-07-29T15:07:25.171000+00:00
-- ended: 2026-07-29T15:07:25.280000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
