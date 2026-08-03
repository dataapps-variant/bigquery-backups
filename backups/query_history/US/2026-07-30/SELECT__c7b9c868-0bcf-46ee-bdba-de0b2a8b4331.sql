-- job_id: c7b9c868-0bcf-46ee-bdba-de0b2a8b4331
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:04:18.608000+00:00
-- started: 2026-07-30T12:04:18.749000+00:00
-- ended: 2026-07-30T12:04:18.968000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
