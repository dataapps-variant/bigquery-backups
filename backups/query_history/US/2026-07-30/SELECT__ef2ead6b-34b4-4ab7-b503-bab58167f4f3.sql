-- job_id: ef2ead6b-34b4-4ab7-b503-bab58167f4f3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T22:01:33.143000+00:00
-- started: 2026-07-30T22:01:33.296000+00:00
-- ended: 2026-07-30T22:01:33.434000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
