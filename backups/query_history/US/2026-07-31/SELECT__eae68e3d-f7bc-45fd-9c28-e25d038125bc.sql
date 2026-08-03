-- job_id: eae68e3d-f7bc-45fd-9c28-e25d038125bc
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T14:03:13.983000+00:00
-- started: 2026-07-31T14:03:14.086000+00:00
-- ended: 2026-07-31T14:03:14.195000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
