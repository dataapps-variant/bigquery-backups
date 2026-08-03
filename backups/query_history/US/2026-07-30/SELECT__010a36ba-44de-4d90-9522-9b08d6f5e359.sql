-- job_id: 010a36ba-44de-4d90-9522-9b08d6f5e359
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T09:03:59+00:00
-- started: 2026-07-30T09:03:59.134000+00:00
-- ended: 2026-07-30T09:03:59.263000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
