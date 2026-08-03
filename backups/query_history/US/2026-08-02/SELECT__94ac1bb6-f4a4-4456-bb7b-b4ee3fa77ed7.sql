-- job_id: 94ac1bb6-f4a4-4456-bb7b-b4ee3fa77ed7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T16:02:28.841000+00:00
-- started: 2026-08-02T16:02:29.088000+00:00
-- ended: 2026-08-02T16:02:29.200000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
