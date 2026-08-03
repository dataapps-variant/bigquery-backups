-- job_id: e088ddb0-1fbc-4e87-b778-7fd5b1ebd762
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T09:01:49.136000+00:00
-- started: 2026-08-01T09:01:49.286000+00:00
-- ended: 2026-08-01T09:01:49.382000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
