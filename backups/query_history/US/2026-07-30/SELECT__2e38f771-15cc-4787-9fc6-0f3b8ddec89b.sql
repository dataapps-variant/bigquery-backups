-- job_id: 2e38f771-15cc-4787-9fc6-0f3b8ddec89b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T07:04:06.679000+00:00
-- started: 2026-07-30T07:04:06.797000+00:00
-- ended: 2026-07-30T07:04:06.911000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
