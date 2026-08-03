-- job_id: 5272485c-c062-4701-9ad9-8f1957a56ddb
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T08:04:14.279000+00:00
-- started: 2026-07-29T08:04:14.364000+00:00
-- ended: 2026-07-29T08:04:14.561000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
