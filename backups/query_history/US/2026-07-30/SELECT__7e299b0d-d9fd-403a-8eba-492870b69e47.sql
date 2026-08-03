-- job_id: 7e299b0d-d9fd-403a-8eba-492870b69e47
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T23:03:38.093000+00:00
-- started: 2026-07-30T23:03:38.206000+00:00
-- ended: 2026-07-30T23:03:38.347000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
