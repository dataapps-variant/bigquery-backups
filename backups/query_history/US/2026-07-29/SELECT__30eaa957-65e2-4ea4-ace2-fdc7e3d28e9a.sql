-- job_id: 30eaa957-65e2-4ea4-ace2-fdc7e3d28e9a
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:36:25.659000+00:00
-- started: 2026-07-29T11:36:25.748000+00:00
-- ended: 2026-07-29T11:36:25.911000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball'
