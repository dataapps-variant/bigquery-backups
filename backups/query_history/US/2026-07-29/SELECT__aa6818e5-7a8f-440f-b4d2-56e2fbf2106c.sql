-- job_id: aa6818e5-7a8f-440f-b4d2-56e2fbf2106c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T05:02:55.037000+00:00
-- started: 2026-07-29T05:02:55.171000+00:00
-- ended: 2026-07-29T05:02:55.302000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
