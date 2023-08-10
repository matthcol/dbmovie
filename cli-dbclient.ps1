# Connect to database
# Usage: cli-dbclient.ps1 [composition-name [env-file]]

# Args:
$composition_name="pg-dbmovie"
$env_file=".env"
if ($args.Count -ge 1) {
    $composition_name=$args[0]
}
if ($args.Count -ge 2) {
    $env_file=$args[1]
}
Write-Debug "Start DB client for composition [$composition_name] with env file [$env_file]"
docker compose -p "$composition_name" exec -it db psql -U movie -d dbmovie