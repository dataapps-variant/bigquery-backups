-- job_id: 0f7178e3-2a89-4644-87cf-a5be0d65a42e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:01:51.686000+00:00
-- started: 2026-07-28T14:01:51.854000+00:00
-- ended: 2026-07-28T14:01:52.021000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
