-- job_id: 4018cc2b-3a6c-4259-82a0-214b93bcf513
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T00:03:15.125000+00:00
-- started: 2026-07-28T00:03:15.230000+00:00
-- ended: 2026-07-28T00:03:15.345000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
