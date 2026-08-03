-- job_id: 35b67841-7012-4c12-968a-88ce727ea310
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T04:04:33.656000+00:00
-- started: 2026-07-30T04:04:33.811000+00:00
-- ended: 2026-07-30T04:04:33.937000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
