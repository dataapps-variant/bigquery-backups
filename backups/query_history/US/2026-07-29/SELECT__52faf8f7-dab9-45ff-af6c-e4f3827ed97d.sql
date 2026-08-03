-- job_id: 52faf8f7-dab9-45ff-af6c-e4f3827ed97d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T23:06:29.940000+00:00
-- started: 2026-07-29T23:06:30.053000+00:00
-- ended: 2026-07-29T23:06:30.187000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
