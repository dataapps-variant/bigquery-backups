-- job_id: 65bbb0bc-d00b-4bd6-8c40-a4e875bcb9d4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T05:01:35.299000+00:00
-- started: 2026-07-28T05:01:35.430000+00:00
-- ended: 2026-07-28T05:01:35.580000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
