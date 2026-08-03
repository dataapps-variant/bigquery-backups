-- job_id: 2460ea56-2238-45c9-a6ce-9b26ee797344
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T04:02:32.070000+00:00
-- started: 2026-08-01T04:02:32.168000+00:00
-- ended: 2026-08-01T04:02:32.316000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
