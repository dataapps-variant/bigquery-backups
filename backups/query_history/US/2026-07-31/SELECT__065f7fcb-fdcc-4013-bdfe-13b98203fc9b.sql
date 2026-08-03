-- job_id: 065f7fcb-fdcc-4013-bdfe-13b98203fc9b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T19:04:31.102000+00:00
-- started: 2026-07-31T19:04:31.205000+00:00
-- ended: 2026-07-31T19:04:31.326000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
