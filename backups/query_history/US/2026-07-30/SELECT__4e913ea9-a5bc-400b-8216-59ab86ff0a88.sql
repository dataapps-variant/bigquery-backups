-- job_id: 4e913ea9-a5bc-400b-8216-59ab86ff0a88
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T08:01:30.823000+00:00
-- started: 2026-07-30T08:01:30.925000+00:00
-- ended: 2026-07-30T08:01:31.050000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
