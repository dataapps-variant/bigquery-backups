-- job_id: 4d85bd1f-74e0-4817-a6c6-3001e3794b91
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T00:01:33.461000+00:00
-- started: 2026-08-03T00:01:33.614000+00:00
-- ended: 2026-08-03T00:01:33.742000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
