-- job_id: 0d32ea96-1afb-487e-b29c-5132e2069fe0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T02:02:25.651000+00:00
-- started: 2026-08-03T02:02:25.749000+00:00
-- ended: 2026-08-03T02:02:25.874000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
