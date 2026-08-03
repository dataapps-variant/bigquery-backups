-- job_id: 88971bbb-68cb-4de7-a57d-28dcd4931593
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T15:02:31.612000+00:00
-- started: 2026-08-02T15:02:31.756000+00:00
-- ended: 2026-08-02T15:02:31.898000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
