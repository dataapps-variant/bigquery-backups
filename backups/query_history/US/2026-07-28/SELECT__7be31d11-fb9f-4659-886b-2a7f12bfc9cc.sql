-- job_id: 7be31d11-fb9f-4659-886b-2a7f12bfc9cc
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T05:01:48.947000+00:00
-- started: 2026-07-28T05:01:49.047000+00:00
-- ended: 2026-07-28T05:01:49.199000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
