-- job_id: 57959867-8826-4c1a-a639-5309716bf6f2
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T21:01:36.653000+00:00
-- started: 2026-07-31T21:01:36.766000+00:00
-- ended: 2026-07-31T21:01:36.883000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
