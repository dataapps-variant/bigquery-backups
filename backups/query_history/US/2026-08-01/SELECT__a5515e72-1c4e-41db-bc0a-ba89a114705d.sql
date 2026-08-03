-- job_id: a5515e72-1c4e-41db-bc0a-ba89a114705d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T16:05:25.805000+00:00
-- started: 2026-08-01T16:05:25.935000+00:00
-- ended: 2026-08-01T16:05:26.075000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
