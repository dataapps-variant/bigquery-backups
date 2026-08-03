-- job_id: 3df834de-f61d-43b0-8a20-a36d8f6604fe
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T10:07:45.950000+00:00
-- started: 2026-07-31T10:07:46.040000+00:00
-- ended: 2026-07-31T10:07:46.180000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
