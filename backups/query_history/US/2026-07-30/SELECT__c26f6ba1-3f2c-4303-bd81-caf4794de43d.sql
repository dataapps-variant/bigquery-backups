-- job_id: c26f6ba1-3f2c-4303-bd81-caf4794de43d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:03:45.412000+00:00
-- started: 2026-07-30T14:03:45.501000+00:00
-- ended: 2026-07-30T14:03:45.608000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
