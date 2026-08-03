-- job_id: 0fa9287e-ce78-4aa3-9ad5-563c4829bc14
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T06:05:01.291000+00:00
-- started: 2026-07-31T06:05:01.402000+00:00
-- ended: 2026-07-31T06:05:01.653000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
