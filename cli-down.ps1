# create a DB container with a GUI client
# Usage: cli-up.ps1 [composition-name [env-file]]

# Args:
$composition_name="pg-dbmovie"
$env_file=".env"
if ($args.Count -ge 1) {
    $composition_name=$args[0]
}
if ($args.Count -ge 2) {
    $env_file=$args[1]
}
Write-Output "Stop and remove docker composition [$composition_name] with env file [$env_file]"

# Example:
# docker compose --env-file .env -p pg-dbmovie down
docker compose --env-file "$env_file" -p "$composition_name" down
