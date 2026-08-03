-- job_id: 1cb68bf5-595e-4d40-898c-df95ede630f3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T04:09:13.181000+00:00
-- started: 2026-08-02T04:09:13.309000+00:00
-- ended: 2026-08-02T04:09:13.625000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
