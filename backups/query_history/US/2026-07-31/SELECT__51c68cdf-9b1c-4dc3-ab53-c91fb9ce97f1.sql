-- job_id: 51c68cdf-9b1c-4dc3-ab53-c91fb9ce97f1
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T05:04:29.541000+00:00
-- started: 2026-07-31T05:04:29.644000+00:00
-- ended: 2026-07-31T05:04:29.763000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
