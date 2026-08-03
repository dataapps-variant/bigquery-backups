-- job_id: fb1e9b88-67c5-4fa4-9486-37919bfdfff8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T20:07:10.567000+00:00
-- started: 2026-08-01T20:07:10.667000+00:00
-- ended: 2026-08-01T20:07:10.765000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
