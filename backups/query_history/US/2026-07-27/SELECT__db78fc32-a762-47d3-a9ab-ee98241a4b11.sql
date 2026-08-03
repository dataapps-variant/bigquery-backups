-- job_id: db78fc32-a762-47d3-a9ab-ee98241a4b11
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T23:06:57.441000+00:00
-- started: 2026-07-27T23:06:57.584000+00:00
-- ended: 2026-07-27T23:06:57.931000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
