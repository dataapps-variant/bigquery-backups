-- job_id: 434b1358-9d4e-4019-91bc-2a54326ad0ab
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T05:04:22.139000+00:00
-- started: 2026-07-31T05:04:22.249000+00:00
-- ended: 2026-07-31T05:04:22.381000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
