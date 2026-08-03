-- job_id: 3fa270fe-a6b7-4309-b94e-f1f30503eb84
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:07:41.367000+00:00
-- started: 2026-07-31T16:07:41.469000+00:00
-- ended: 2026-07-31T16:07:41.588000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
