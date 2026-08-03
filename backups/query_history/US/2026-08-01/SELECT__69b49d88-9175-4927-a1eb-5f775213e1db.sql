-- job_id: 69b49d88-9175-4927-a1eb-5f775213e1db
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T10:02:20.672000+00:00
-- started: 2026-08-01T10:02:20.748000+00:00
-- ended: 2026-08-01T10:02:20.864000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
