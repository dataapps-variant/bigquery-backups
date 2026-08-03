-- job_id: 3a1b5498-88e2-402f-b6fa-89e87cf77f50
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T06:04:36.205000+00:00
-- started: 2026-07-28T06:04:36.302000+00:00
-- ended: 2026-07-28T06:04:36.431000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
