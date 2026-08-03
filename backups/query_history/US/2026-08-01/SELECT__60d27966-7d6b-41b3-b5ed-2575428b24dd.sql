-- job_id: 60d27966-7d6b-41b3-b5ed-2575428b24dd
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T23:04:20.226000+00:00
-- started: 2026-08-01T23:04:20.485000+00:00
-- ended: 2026-08-01T23:04:20.615000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
