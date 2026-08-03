-- job_id: 19ad3483-541a-4179-841f-98ed3810a3bf
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T22:01:58.699000+00:00
-- started: 2026-07-28T22:01:58.854000+00:00
-- ended: 2026-07-28T22:01:58.967000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
