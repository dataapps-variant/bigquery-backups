-- job_id: e4161ae6-ef34-428e-8e6b-7d06c59fcd4d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T22:04:22.005000+00:00
-- started: 2026-07-30T22:04:22.144000+00:00
-- ended: 2026-07-30T22:04:22.283000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
