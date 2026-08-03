-- job_id: cfe620c3-1ba5-4934-9934-07a513b1ec8f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T04:01:48.703000+00:00
-- started: 2026-08-01T04:01:48.867000+00:00
-- ended: 2026-08-01T04:01:48.992000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
