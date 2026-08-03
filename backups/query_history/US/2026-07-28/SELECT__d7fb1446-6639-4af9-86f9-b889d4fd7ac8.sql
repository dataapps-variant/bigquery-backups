-- job_id: d7fb1446-6639-4af9-86f9-b889d4fd7ac8
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T01:03:38.517000+00:00
-- started: 2026-07-28T01:03:38.608000+00:00
-- ended: 2026-07-28T01:03:39.125000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'contractsdotnetllc' AND order_id IS NOT NULL
