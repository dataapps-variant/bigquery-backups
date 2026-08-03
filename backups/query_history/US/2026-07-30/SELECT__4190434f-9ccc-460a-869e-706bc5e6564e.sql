-- job_id: 4190434f-9ccc-460a-869e-706bc5e6564e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:05:39.151000+00:00
-- started: 2026-07-30T13:05:39.259000+00:00
-- ended: 2026-07-30T13:05:39.391000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
