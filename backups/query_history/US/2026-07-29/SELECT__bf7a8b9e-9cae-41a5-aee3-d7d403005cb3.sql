-- job_id: bf7a8b9e-9cae-41a5-aee3-d7d403005cb3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T19:03:20.527000+00:00
-- started: 2026-07-29T19:03:20.649000+00:00
-- ended: 2026-07-29T19:03:20.801000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
