-- job_id: 43916e5c-92aa-4d5b-bd51-8839d52168d7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T09:05:31.144000+00:00
-- started: 2026-07-31T09:05:31.270000+00:00
-- ended: 2026-07-31T09:05:31.391000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
