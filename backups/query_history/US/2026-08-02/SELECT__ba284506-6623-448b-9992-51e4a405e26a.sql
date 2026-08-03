-- job_id: ba284506-6623-448b-9992-51e4a405e26a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T13:07:20.810000+00:00
-- started: 2026-08-02T13:07:20.950000+00:00
-- ended: 2026-08-02T13:07:21.064000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
