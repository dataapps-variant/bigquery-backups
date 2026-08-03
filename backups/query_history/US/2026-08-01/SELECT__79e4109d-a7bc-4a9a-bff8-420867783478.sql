-- job_id: 79e4109d-a7bc-4a9a-bff8-420867783478
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T13:02:28.644000+00:00
-- started: 2026-08-01T13:02:28.743000+00:00
-- ended: 2026-08-01T13:02:28.853000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
