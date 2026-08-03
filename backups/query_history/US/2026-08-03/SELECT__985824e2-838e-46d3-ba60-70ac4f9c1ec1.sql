-- job_id: 985824e2-838e-46d3-ba60-70ac4f9c1ec1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T08:03:37.249000+00:00
-- started: 2026-08-03T08:03:37.368000+00:00
-- ended: 2026-08-03T08:03:37.481000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
