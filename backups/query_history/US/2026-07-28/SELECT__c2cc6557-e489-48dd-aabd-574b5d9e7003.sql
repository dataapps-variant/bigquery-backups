-- job_id: c2cc6557-e489-48dd-aabd-574b5d9e7003
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T17:03:06.216000+00:00
-- started: 2026-07-28T17:03:06.316000+00:00
-- ended: 2026-07-28T17:03:06.509000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
