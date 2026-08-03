-- job_id: bb682d31-7beb-4969-b6b0-633321882fb0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T22:38:34.350000+00:00
-- started: 2026-07-30T22:38:34.481000+00:00
-- ended: 2026-07-30T22:38:34.600000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
