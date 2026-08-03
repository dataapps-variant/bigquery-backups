-- job_id: 61540cfc-0c40-46ce-b538-99fbff75ad27
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:19:22.953000+00:00
-- started: 2026-07-29T13:19:23.046000+00:00
-- ended: 2026-07-29T13:19:23.145000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
