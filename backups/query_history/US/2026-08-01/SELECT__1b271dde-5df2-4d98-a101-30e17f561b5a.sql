-- job_id: 1b271dde-5df2-4d98-a101-30e17f561b5a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T09:04:54.228000+00:00
-- started: 2026-08-01T09:04:54.456000+00:00
-- ended: 2026-08-01T09:04:54.573000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
