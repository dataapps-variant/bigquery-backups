-- job_id: 7616d13a-a8ea-41d6-a4f8-64274242b1b0
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T05:02:57.740000+00:00
-- started: 2026-08-03T05:02:57.900000+00:00
-- ended: 2026-08-03T05:02:58.034000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
