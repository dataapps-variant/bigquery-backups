-- job_id: b1cada1b-078b-4444-a71b-c3812c5cbd70
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T20:03:44.357000+00:00
-- started: 2026-07-27T20:03:44.494000+00:00
-- ended: 2026-07-27T20:03:44.653000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
