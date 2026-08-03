-- job_id: a956dbfb-4712-4216-9f7c-6f6dc3dde7fc
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:07:23.493000+00:00
-- started: 2026-08-01T12:07:23.612000+00:00
-- ended: 2026-08-01T12:07:23.775000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
