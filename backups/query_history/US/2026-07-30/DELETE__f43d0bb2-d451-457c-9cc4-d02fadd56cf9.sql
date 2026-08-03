-- job_id: f43d0bb2-d451-457c-9cc4-d02fadd56cf9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T06:18:52.510000+00:00
-- started: 2026-07-30T06:18:52.882000+00:00
-- ended: 2026-07-30T06:18:54.047000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders`
        WHERE company = 'jobflowllc' AND order_id IN ('7233097', '7146641')
