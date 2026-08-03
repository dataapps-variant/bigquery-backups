-- job_id: 2efbf7e1-a046-47b3-8242-5cab63152a38
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T22:01:10.260000+00:00
-- started: 2026-08-01T22:01:10.370000+00:00
-- ended: 2026-08-01T22:01:10.496000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
