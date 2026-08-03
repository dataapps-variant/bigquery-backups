-- job_id: 0acd2b1c-aee6-4ec4-9432-d21a854abb83
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:02:59.037000+00:00
-- started: 2026-07-28T15:02:59.161000+00:00
-- ended: 2026-07-28T15:02:59.273000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
