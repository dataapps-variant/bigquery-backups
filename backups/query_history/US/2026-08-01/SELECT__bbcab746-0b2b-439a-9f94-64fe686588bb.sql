-- job_id: bbcab746-0b2b-439a-9f94-64fe686588bb
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T03:04:11.803000+00:00
-- started: 2026-08-01T03:04:11.900000+00:00
-- ended: 2026-08-01T03:04:12.032000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
