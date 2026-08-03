-- job_id: 6f087f36-69f8-4873-8521-a87bcac9daf9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T14:03:24.339000+00:00
-- started: 2026-07-27T14:03:24.467000+00:00
-- ended: 2026-07-27T14:03:24.600000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
