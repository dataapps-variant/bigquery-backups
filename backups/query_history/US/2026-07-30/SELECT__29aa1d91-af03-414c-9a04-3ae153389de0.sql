-- job_id: 29aa1d91-af03-414c-9a04-3ae153389de0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T00:03:19.659000+00:00
-- started: 2026-07-30T00:03:19.865000+00:00
-- ended: 2026-07-30T00:03:19.978000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
