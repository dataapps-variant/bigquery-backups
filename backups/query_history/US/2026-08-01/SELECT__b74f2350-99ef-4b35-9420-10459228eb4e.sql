-- job_id: b74f2350-99ef-4b35-9420-10459228eb4e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T21:07:17.313000+00:00
-- started: 2026-08-01T21:07:17.405000+00:00
-- ended: 2026-08-01T21:07:17.642000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
