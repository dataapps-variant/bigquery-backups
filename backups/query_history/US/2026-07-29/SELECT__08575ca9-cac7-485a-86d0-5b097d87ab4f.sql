-- job_id: 08575ca9-cac7-485a-86d0-5b097d87ab4f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T19:05:20.943000+00:00
-- started: 2026-07-29T19:05:21.075000+00:00
-- ended: 2026-07-29T19:05:21.336000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
