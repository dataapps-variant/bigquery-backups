-- job_id: 27b454d2-a103-44f2-9d6c-92b2fcf6c73f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:02:06.503000+00:00
-- started: 2026-07-28T13:02:06.613000+00:00
-- ended: 2026-07-28T13:02:06.741000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
