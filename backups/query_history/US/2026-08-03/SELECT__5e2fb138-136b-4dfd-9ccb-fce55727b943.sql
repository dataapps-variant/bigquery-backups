-- job_id: 5e2fb138-136b-4dfd-9ccb-fce55727b943
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T03:02:54.654000+00:00
-- started: 2026-08-03T03:02:54.877000+00:00
-- ended: 2026-08-03T03:02:55.002000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
