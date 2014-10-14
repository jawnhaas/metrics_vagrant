name "example"
description "example role that includes the app_server role and the rjmetrics app in it's run_list"

run_list(
  "role[app_server]",
  "recipe[rjmetrics]"
)
