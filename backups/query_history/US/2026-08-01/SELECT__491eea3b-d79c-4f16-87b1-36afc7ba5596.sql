-- job_id: 491eea3b-d79c-4f16-87b1-36afc7ba5596
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T13:06:55.981000+00:00
-- started: 2026-08-01T13:06:56.067000+00:00
-- ended: 2026-08-01T13:06:56.299000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
