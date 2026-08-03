-- job_id: 1cb39d71-9742-4e97-b435-d58bbb3880c2
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T01:06:14.865000+00:00
-- started: 2026-07-31T01:06:14.967000+00:00
-- ended: 2026-07-31T01:06:15.078000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
