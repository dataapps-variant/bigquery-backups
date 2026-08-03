-- job_id: 92665cf1-3f37-4f29-a9b1-5af27ea5012c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T02:01:23.440000+00:00
-- started: 2026-07-31T02:01:23.590000+00:00
-- ended: 2026-07-31T02:01:23.724000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
