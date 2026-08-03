-- job_id: e7203435-d21f-4fa4-8a82-c250277ef95e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:01:50.537000+00:00
-- started: 2026-07-30T13:01:50.663000+00:00
-- ended: 2026-07-30T13:01:50.777000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
