-- job_id: 068cde8f-b883-4108-808d-4988b3218125
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:04:15.575000+00:00
-- started: 2026-08-03T13:04:15.999000+00:00
-- ended: 2026-08-03T13:04:16.127000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
