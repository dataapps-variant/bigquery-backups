-- job_id: fde06ec9-5acf-455f-8d8e-44af7a043cc9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T23:02:25.933000+00:00
-- started: 2026-07-31T23:02:26.059000+00:00
-- ended: 2026-07-31T23:02:26.206000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
