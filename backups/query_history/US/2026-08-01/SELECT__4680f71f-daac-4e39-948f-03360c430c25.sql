-- job_id: 4680f71f-daac-4e39-948f-03360c430c25
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T19:04:19.679000+00:00
-- started: 2026-08-01T19:04:19.802000+00:00
-- ended: 2026-08-01T19:04:19.911000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
