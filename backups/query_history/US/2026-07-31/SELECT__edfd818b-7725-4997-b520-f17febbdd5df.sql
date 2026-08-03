-- job_id: edfd818b-7725-4997-b520-f17febbdd5df
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T22:04:50.364000+00:00
-- started: 2026-07-31T22:04:50.442000+00:00
-- ended: 2026-07-31T22:04:50.557000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
