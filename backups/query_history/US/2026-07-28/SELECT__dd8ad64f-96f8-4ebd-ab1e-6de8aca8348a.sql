-- job_id: dd8ad64f-96f8-4ebd-ab1e-6de8aca8348a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:04:11.070000+00:00
-- started: 2026-07-28T15:04:11.158000+00:00
-- ended: 2026-07-28T15:04:11.290000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
