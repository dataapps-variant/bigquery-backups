-- job_id: 1f751ca2-560a-4956-957c-03a4f8672cc5
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T01:02:30.400000+00:00
-- started: 2026-07-30T01:02:30.517000+00:00
-- ended: 2026-07-30T01:02:30.644000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
