-- job_id: 14daabde-c362-4d12-9776-acb31012e5eb
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T06:08:38.619000+00:00
-- started: 2026-07-30T06:08:39.011000+00:00
-- ended: 2026-07-30T06:08:39.989000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders`
        WHERE company = 'mindworksllc' AND order_id IN ('7247288')
