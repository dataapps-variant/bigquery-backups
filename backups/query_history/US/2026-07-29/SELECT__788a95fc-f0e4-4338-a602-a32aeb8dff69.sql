-- job_id: 788a95fc-f0e4-4338-a602-a32aeb8dff69
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T23:06:35.013000+00:00
-- started: 2026-07-29T23:06:35.146000+00:00
-- ended: 2026-07-29T23:06:35.247000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
