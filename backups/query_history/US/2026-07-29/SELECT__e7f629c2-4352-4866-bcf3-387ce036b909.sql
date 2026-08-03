-- job_id: e7f629c2-4352-4866-bcf3-387ce036b909
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T04:02:52.266000+00:00
-- started: 2026-07-29T04:02:52.387000+00:00
-- ended: 2026-07-29T04:02:52.512000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
