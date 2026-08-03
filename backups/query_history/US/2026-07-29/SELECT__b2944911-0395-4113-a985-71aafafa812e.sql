-- job_id: b2944911-0395-4113-a985-71aafafa812e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:04:17.045000+00:00
-- started: 2026-07-29T15:04:17.141000+00:00
-- ended: 2026-07-29T15:04:17.303000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
