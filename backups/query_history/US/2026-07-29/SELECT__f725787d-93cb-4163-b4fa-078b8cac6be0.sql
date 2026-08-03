-- job_id: f725787d-93cb-4163-b4fa-078b8cac6be0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T02:06:36.208000+00:00
-- started: 2026-07-29T02:06:36.316000+00:00
-- ended: 2026-07-29T02:06:36.423000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
