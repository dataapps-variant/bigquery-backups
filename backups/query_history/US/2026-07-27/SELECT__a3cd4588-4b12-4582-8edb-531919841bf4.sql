-- job_id: a3cd4588-4b12-4582-8edb-531919841bf4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T14:03:35.713000+00:00
-- started: 2026-07-27T14:03:35.820000+00:00
-- ended: 2026-07-27T14:03:35.958000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
