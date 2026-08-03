-- job_id: 65a10c31-0379-472b-8857-80a80d252fb8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T01:05:57.054000+00:00
-- started: 2026-07-31T01:05:57.178000+00:00
-- ended: 2026-07-31T01:05:57.307000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
