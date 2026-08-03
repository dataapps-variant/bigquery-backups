-- job_id: 0c9b712f-2879-40d9-a757-8c6a6c494749
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T04:02:27.987000+00:00
-- started: 2026-07-31T04:02:28.100000+00:00
-- ended: 2026-07-31T04:02:28.240000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
