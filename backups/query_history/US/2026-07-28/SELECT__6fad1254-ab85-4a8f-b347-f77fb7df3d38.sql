-- job_id: 6fad1254-ab85-4a8f-b347-f77fb7df3d38
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T00:02:28.181000+00:00
-- started: 2026-07-28T00:02:28.313000+00:00
-- ended: 2026-07-28T00:02:28.441000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
