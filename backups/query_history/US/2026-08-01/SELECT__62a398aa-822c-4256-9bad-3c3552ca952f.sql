-- job_id: 62a398aa-822c-4256-9bad-3c3552ca952f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T13:04:56.371000+00:00
-- started: 2026-08-01T13:04:56.487000+00:00
-- ended: 2026-08-01T13:04:56.589000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
