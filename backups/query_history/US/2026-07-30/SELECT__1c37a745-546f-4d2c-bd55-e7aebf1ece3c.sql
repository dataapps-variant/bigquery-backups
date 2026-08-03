-- job_id: 1c37a745-546f-4d2c-bd55-e7aebf1ece3c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T00:03:56.184000+00:00
-- started: 2026-07-30T00:03:56.277000+00:00
-- ended: 2026-07-30T00:03:56.411000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
