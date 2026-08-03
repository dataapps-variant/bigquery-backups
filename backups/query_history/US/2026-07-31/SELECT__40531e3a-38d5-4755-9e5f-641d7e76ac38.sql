-- job_id: 40531e3a-38d5-4755-9e5f-641d7e76ac38
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T00:01:33.672000+00:00
-- started: 2026-07-31T00:01:33.819000+00:00
-- ended: 2026-07-31T00:01:33.959000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
