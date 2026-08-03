-- job_id: 5242110e-39b9-4b0a-a3b0-1cc21e575c22
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T21:02:04.138000+00:00
-- started: 2026-08-01T21:02:04.254000+00:00
-- ended: 2026-08-01T21:02:04.386000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
