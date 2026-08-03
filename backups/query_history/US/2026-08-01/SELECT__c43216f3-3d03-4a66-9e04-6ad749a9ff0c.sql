-- job_id: c43216f3-3d03-4a66-9e04-6ad749a9ff0c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T22:01:54.207000+00:00
-- started: 2026-08-01T22:01:54.297000+00:00
-- ended: 2026-08-01T22:01:54.418000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
