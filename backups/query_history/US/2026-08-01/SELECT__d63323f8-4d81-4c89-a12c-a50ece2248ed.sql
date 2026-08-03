-- job_id: d63323f8-4d81-4c89-a12c-a50ece2248ed
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T00:03:18.053000+00:00
-- started: 2026-08-01T00:03:18.167000+00:00
-- ended: 2026-08-01T00:03:18.319000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
