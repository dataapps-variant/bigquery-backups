-- job_id: 47c065f6-3b57-4a8a-8410-d77bd11a17be
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T20:06:31.998000+00:00
-- started: 2026-07-31T20:06:32.116000+00:00
-- ended: 2026-07-31T20:06:32.220000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
