-- job_id: 625d184b-2873-42ae-8f22-540c33104184
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T00:01:18.705000+00:00
-- started: 2026-07-31T00:01:18.887000+00:00
-- ended: 2026-07-31T00:01:19.002000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
