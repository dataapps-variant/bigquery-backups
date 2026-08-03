-- job_id: c8350ef1-dadb-4878-a363-c83855908078
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T15:07:09.534000+00:00
-- started: 2026-07-27T15:07:09.646000+00:00
-- ended: 2026-07-27T15:07:09.775000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
