-- job_id: 8a519dcd-c191-4d70-a463-aa24f32d6974
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T04:03:30.299000+00:00
-- started: 2026-07-29T04:03:30.565000+00:00
-- ended: 2026-07-29T04:03:30.698000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
