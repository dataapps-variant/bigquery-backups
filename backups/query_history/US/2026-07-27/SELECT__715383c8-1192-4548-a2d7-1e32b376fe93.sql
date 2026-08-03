-- job_id: 715383c8-1192-4548-a2d7-1e32b376fe93
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T20:08:08.559000+00:00
-- started: 2026-07-27T20:08:08.681000+00:00
-- ended: 2026-07-27T20:08:08.791000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
