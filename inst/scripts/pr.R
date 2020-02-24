check <- gh::gh("GET /repos/:owner/:repo/commits/:ref/check-runs",
       owner = "ropensci-org",
       repo = "blog-guidance",
       ref = Sys.getenv("sha"),
       .send_headers = c(Accept = "application/vnd.github.antiope-preview+json"),
       .token = Sys.getenv("GITHUB_TOKEN2"))

gh::gh("PATCH /repos/:owner/:repo/check-runs/:check_run_id",
       owner = "ropensci-org",
       repo = "blog-guidance",
       check_run_id = check$check_runs[[1]]$id,
       conclusion = "success",
       output = list (
         "title" = "BLABLA",
         "summary" = "[yeah](https://masalmon.eu)",
         "text" = "[text](https://masalmon.eu)"),
       .send_headers = c(Accept = "application/vnd.github.antiope-preview+json"))