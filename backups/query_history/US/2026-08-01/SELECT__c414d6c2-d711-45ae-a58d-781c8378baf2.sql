-- job_id: c414d6c2-d711-45ae-a58d-781c8378baf2
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T05:01:10.508000+00:00
-- started: 2026-08-01T05:01:10.623000+00:00
-- ended: 2026-08-01T05:01:10.752000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
