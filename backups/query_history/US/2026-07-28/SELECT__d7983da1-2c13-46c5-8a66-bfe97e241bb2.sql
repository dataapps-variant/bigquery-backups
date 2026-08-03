-- job_id: d7983da1-2c13-46c5-8a66-bfe97e241bb2
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T11:05:06.578000+00:00
-- started: 2026-07-28T11:05:06.675000+00:00
-- ended: 2026-07-28T11:05:07.005000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
