-- job_id: a4a1bd49-1ecb-4460-96aa-26f18acee95d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T21:05:23.902000+00:00
-- started: 2026-07-27T21:05:24.010000+00:00
-- ended: 2026-07-27T21:05:24.152000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
