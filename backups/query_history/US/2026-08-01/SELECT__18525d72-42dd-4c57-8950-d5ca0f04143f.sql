-- job_id: 18525d72-42dd-4c57-8950-d5ca0f04143f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T00:04:18.800000+00:00
-- started: 2026-08-01T00:04:18.906000+00:00
-- ended: 2026-08-01T00:04:19.047000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
