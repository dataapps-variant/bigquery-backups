-- job_id: 8269ce05-739f-47e7-b2e0-e04581f9d8f6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T03:01:11.721000+00:00
-- started: 2026-07-30T03:01:11.856000+00:00
-- ended: 2026-07-30T03:01:11.967000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
