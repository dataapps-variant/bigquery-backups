-- job_id: 7019dabf-e07f-4c7c-b588-77a846ef312d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T19:01:55.810000+00:00
-- started: 2026-07-27T19:01:55.961000+00:00
-- ended: 2026-07-27T19:01:56.145000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
