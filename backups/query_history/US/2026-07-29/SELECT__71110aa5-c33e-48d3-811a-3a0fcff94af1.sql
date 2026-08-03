-- job_id: 71110aa5-c33e-48d3-811a-3a0fcff94af1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T06:04:31.791000+00:00
-- started: 2026-07-29T06:04:32.054000+00:00
-- ended: 2026-07-29T06:04:32.197000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
