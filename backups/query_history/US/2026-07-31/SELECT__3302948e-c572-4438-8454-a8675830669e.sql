-- job_id: 3302948e-c572-4438-8454-a8675830669e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T08:04:34.793000+00:00
-- started: 2026-07-31T08:04:34.906000+00:00
-- ended: 2026-07-31T08:04:35.013000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
