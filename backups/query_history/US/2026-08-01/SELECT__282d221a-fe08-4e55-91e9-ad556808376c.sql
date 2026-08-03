-- job_id: 282d221a-fe08-4e55-91e9-ad556808376c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T23:02:11.154000+00:00
-- started: 2026-08-01T23:02:11.249000+00:00
-- ended: 2026-08-01T23:02:11.364000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
