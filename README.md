# Samples-anthing

This is repo for backup scripts, templates, binary or samples about founded or creature by myself

<div align="center">
    <img src="https://media1.giphy.com/media/3orieS4jfHJaKwkeli/giphy.gif">
    <strong><em><p style="text-align: center;">"It wat is it , If you know you know, bro"</p></em></strong>
</div>

## Tables of samples:
1. **formatters**: **find the formatters to parse or print something**
    - [curl-format.txt](./formatters/curl/curl-format.txt): print the formatters of curl requests

2. **scripts**: **place where to put the sample files of bash scripts or powershell scripts**
    - [bash](./scripts/bash/): *bash script for running in shell bash or linux (Remember put +x for running)*
      - [config_portainer](./scripts/bash/config_portainer.sh): create a tools for create or resetpassword with portainer via container docker
      - [proactive_pg_db_performance_scanner](./scripts/bash/proactive_pg_db_performance_scanner.sh): create a tools for managing and monitoring your postgresql databases via pg tools
      - [retrive_file_s3](./scripts/bash/retrive_file_s3.sh): script for getting the data of file from s3 bucket
      - [synchronize_gitlab](./scripts/bash/synchronize_gitlab.sh): script for synchronizing between two folder of gitlab via MR actions
      - [upload_file_to_s3](./scripts/bash/upload_file_s3.sh): script for searching and replace a old file in s3 bucket with a new one
      - [zero_downtime_nginx](./scripts/bash/zero_downtime_nginx.sh): script for doing manipulation task with non't downtime in nginx and provide the function to make it cronjob to automation CD operations
   - [powershell](./scripts/powershell/): *powershell script for running inside the windows or windows shell linux*
      - [azure_agent_runner](./scripts/powershell/azure_agent_runner.ps1): script for make a image with `packer` to create a agent runner in `Window` machine for `Azure Cloud` with combine something to running automation test with `C#` inside
   - [ansible](./scripts/ansible/): *ansible template for configuration something inside linux or window machine*
      - [postgres_docker_tasks](./scripts/ansible/postgres_docker_tasks.yaml): ansible script for configuration the postgres running inside the docker container
      - [postgres_itself_tasks](./scripts/ansible/postgres_itself_tasks.yaml): ansible script for configuration the postgres running inside the inside linux machine 

3. **templates: Putting the tempalate of multiple tools or using for running inside the specify thing**
   - [ci](./templates/ci/): *Puting the templates of CI/CD tools with specify things*
      - [.gitlab-ci](./templates/ci/.gitlab-ci.yml): `Gitlab CI` use to running the task inside `Gitlab` container - Extend with build image the inside Docker with `Gitlab`
   - [grafana_dashboard](./templates/grafana_dashboards/): *Templates of Gr afan Dashboard to specify the Dashboard for monitoring*
      - [Azure PostgreSQL Queries](./templates/grafana_dashboards/Azure%20PostgreSQL%20Queries-1692262468003.json): Dashboard for monitoring the `PostgreSQL` via `pg_tools` have intergrated in `Azure Cloud`
      - [Mongodb Metrics Dashboard](./templates/grafana_dashboards/Mongodb%20Metrics%20Dashboard-1692262571804.json): Dashboard for monitoring the `Metrics` of `MongoDB` with `Exporter` inside the `Kubernetes`
   - [nginx](./templates/nginx/): *Templates of nginx webserver for specify task*
      - [default_nginx](./templates/nginx/default_nginx.conf): This is configuration for default setting up of nginx. Usually It is `nginx.conf`
      - [default_upstream_ssl](./templates/nginx/default_upstream_ssl.conf): This is configuration for nginx in upstream for `LB` `Proxy` used `Letencrypt` for `SSL`
      - [portainer_with_ssl](./templates/nginx/portainer_with_ssl.conf): This is nginx configuration for setting up of nginx proxy with `Portainer` used `SSL`
      - [zero_downtime_basic_upstream_ssl](./templates/nginx/zero_downtime_basic_upstream_ssl.conf): Zero downtime with nginx configuration to force traffic into new one used `Blue-Green Deployments`

---
## Conclusions 
**This is my knowledge about the whatnews when is applied anything else into work, so happily if you want to contributing anything with me. Please request if you want, so happily hacking and setting up anything :rocket::rocket::rocket::rocket::rocket::rocket::rocket:**