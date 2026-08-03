-- job_id: fdb9fc88-0968-487c-a327-1063a219600a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T03:03:21.176000+00:00
-- started: 2026-08-01T03:03:21.313000+00:00
-- ended: 2026-08-01T03:03:21.453000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
