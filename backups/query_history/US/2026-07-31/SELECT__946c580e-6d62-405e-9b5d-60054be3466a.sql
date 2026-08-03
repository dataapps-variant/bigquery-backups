-- job_id: 946c580e-6d62-405e-9b5d-60054be3466a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:04:43.159000+00:00
-- started: 2026-07-31T12:04:43.332000+00:00
-- ended: 2026-07-31T12:04:43.436000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
