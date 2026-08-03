-- job_id: 9489a81f-a378-4d04-a283-361fef907e26
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T22:03:42.333000+00:00
-- started: 2026-07-29T22:03:42.421000+00:00
-- ended: 2026-07-29T22:03:42.551000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
