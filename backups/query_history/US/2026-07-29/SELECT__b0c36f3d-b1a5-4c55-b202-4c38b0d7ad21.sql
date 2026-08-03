-- job_id: b0c36f3d-b1a5-4c55-b202-4c38b0d7ad21
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:20:22.015000+00:00
-- started: 2026-07-29T11:20:22.146000+00:00
-- ended: 2026-07-29T11:20:22.511000+00:00

SELECT Cohort, `Table` t, COUNT(*) n FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` GROUP BY 1,2 ORDER BY 1,2
