-- job_id: 45c11e3a-d74c-48fb-9a17-b795808b5dc7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T04:01:18.626000+00:00
-- started: 2026-07-28T04:01:18.748000+00:00
-- ended: 2026-07-28T04:01:18.859000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
