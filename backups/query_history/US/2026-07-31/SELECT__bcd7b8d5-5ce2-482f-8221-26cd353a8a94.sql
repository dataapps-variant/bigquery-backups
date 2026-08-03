-- job_id: bcd7b8d5-5ce2-482f-8221-26cd353a8a94
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T05:07:23.634000+00:00
-- started: 2026-07-31T05:07:23.734000+00:00
-- ended: 2026-07-31T05:07:23.859000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'brainable' AND order_id IS NOT NULL
