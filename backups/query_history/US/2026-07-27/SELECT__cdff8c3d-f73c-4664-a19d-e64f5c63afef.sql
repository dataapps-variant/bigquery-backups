-- job_id: cdff8c3d-f73c-4664-a19d-e64f5c63afef
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T20:08:23.112000+00:00
-- started: 2026-07-27T20:08:23.325000+00:00
-- ended: 2026-07-27T20:08:23.448000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
