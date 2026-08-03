-- job_id: e5468306-7501-43f2-8a9f-c4a2188b849d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T04:05:57.749000+00:00
-- started: 2026-08-03T04:05:57.865000+00:00
-- ended: 2026-08-03T04:05:57.979000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
