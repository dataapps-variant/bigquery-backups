-- job_id: c2f3c4f0-021f-4091-9a0d-32f01dc35067
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T16:05:23.623000+00:00
-- started: 2026-07-28T16:05:23.740000+00:00
-- ended: 2026-07-28T16:05:23.871000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
