-- job_id: a3bdb934-7ded-4c24-9792-4faa4e469287
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:03:34.821000+00:00
-- started: 2026-07-31T15:03:34.927000+00:00
-- ended: 2026-07-31T15:03:35.071000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
