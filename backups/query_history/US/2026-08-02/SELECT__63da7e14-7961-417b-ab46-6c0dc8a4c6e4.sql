-- job_id: 63da7e14-7961-417b-ab46-6c0dc8a4c6e4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T07:03:36.086000+00:00
-- started: 2026-08-02T07:03:36.222000+00:00
-- ended: 2026-08-02T07:03:36.337000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
