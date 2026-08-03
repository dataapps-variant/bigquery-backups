-- job_id: 5f37bd61-4480-413c-b734-1b64d96d5e8a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T23:01:42.507000+00:00
-- started: 2026-07-31T23:01:42.664000+00:00
-- ended: 2026-07-31T23:01:42.780000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
