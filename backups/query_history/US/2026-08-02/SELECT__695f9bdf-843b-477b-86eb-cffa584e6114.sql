-- job_id: 695f9bdf-843b-477b-86eb-cffa584e6114
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T21:10:33.175000+00:00
-- started: 2026-08-02T21:10:33.304000+00:00
-- ended: 2026-08-02T21:10:33.402000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
