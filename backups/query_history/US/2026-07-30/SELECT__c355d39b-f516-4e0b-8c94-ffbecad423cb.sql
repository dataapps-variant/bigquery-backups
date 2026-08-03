-- job_id: c355d39b-f516-4e0b-8c94-ffbecad423cb
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T05:01:33.870000+00:00
-- started: 2026-07-30T05:01:33.999000+00:00
-- ended: 2026-07-30T05:01:34.139000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
