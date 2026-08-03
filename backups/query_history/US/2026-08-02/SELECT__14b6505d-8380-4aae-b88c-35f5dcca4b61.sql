-- job_id: 14b6505d-8380-4aae-b88c-35f5dcca4b61
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T00:01:28.149000+00:00
-- started: 2026-08-02T00:01:28.255000+00:00
-- ended: 2026-08-02T00:01:28.369000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
