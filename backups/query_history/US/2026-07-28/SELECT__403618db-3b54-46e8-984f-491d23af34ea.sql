-- job_id: 403618db-3b54-46e8-984f-491d23af34ea
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T07:11:09.311000+00:00
-- started: 2026-07-28T07:11:09.424000+00:00
-- ended: 2026-07-28T07:11:09.539000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
