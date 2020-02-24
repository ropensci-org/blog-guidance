check <- gh::gh("GET /repos/:owner/:repo/commits/:ref/check-runs",
       owner = "ropensci-org",
       repo = "blog-guidance",
       ref = gert::git_log(max = 1)$commit,
       .send_headers = c(Accept = "application/vnd.github.antiope-preview+json"))

gh::gh("PATCH /repos/:owner/:repo/check-runs/:check_run_id",
       owner = "ropensci-org",
       repo = "blog-guidance",
       check_run_id = check$check_runs[[1]]$id,
       details_url = "https://masalmon.eu",
       .send_headers = c(Accept = "application/vnd.github.antiope-preview+json"))