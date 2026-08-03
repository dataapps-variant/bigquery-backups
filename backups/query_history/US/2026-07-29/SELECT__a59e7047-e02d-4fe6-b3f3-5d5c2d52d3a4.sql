-- job_id: a59e7047-e02d-4fe6-b3f3-5d5c2d52d3a4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T06:07:51.799000+00:00
-- started: 2026-07-29T06:07:51.910000+00:00
-- ended: 2026-07-29T06:07:52.106000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
