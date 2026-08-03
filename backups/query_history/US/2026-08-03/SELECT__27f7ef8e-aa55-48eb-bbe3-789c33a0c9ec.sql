-- job_id: 27f7ef8e-aa55-48eb-bbe3-789c33a0c9ec
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T05:01:45.449000+00:00
-- started: 2026-08-03T05:01:45.788000+00:00
-- ended: 2026-08-03T05:01:45.906000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
