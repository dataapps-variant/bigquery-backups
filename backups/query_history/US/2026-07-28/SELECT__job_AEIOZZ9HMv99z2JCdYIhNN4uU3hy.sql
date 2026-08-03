-- job_id: job_AEIOZZ9HMv99z2JCdYIhNN4uU3hy
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:09:49.125000+00:00
-- started: 2026-07-28T15:09:49.239000+00:00
-- ended: 2026-07-28T15:09:51.739000+00:00

SELECT MAX(activity_date) AS max_activity, MAX(cohort_date) AS max_cohort, COUNT(*) AS n FROM `variant-finance-data-project.R100.R100_Historical_Main`
