-- job_id: 5d7894bf-d4a9-4add-aaf5-2090c7a78206
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T06:05:31.312000+00:00
-- started: 2026-07-29T06:05:31.383000+00:00
-- ended: 2026-07-29T06:05:31.578000+00:00


           SELECT DISTINCT order_id, last_modified 
           FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
