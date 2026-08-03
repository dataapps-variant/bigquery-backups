-- job_id: 42f5163c-4de5-4f74-97e2-cf6ad17c09d5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T21:08:08.757000+00:00
-- started: 2026-07-27T21:08:08.904000+00:00
-- ended: 2026-07-27T21:08:09.027000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
