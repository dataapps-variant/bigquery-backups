-- job_id: cc36a6a2-4563-4305-899c-804b37d31df6
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T06:10:53.990000+00:00
-- started: 2026-07-30T06:10:54.448000+00:00
-- ended: 2026-07-30T06:10:55.418000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders`
        WHERE company = 'pdfdotnet' AND order_id IN ('1865486', '2052616', '2331907', '2137346')
