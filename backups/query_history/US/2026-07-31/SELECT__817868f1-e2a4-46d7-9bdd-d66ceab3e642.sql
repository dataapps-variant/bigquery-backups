-- job_id: 817868f1-e2a4-46d7-9bdd-d66ceab3e642
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:08:04.799000+00:00
-- started: 2026-07-31T12:08:04.920000+00:00
-- ended: 2026-07-31T12:08:05.025000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
