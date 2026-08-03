-- job_id: 8a9b42a9-242d-48aa-94ad-afd2e4504968
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T06:06:28.209000+00:00
-- started: 2026-07-31T06:06:28.412000+00:00
-- ended: 2026-07-31T06:06:28.531000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
