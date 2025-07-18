
# Supabase Automatic Backup Script

This repository contains a PowerShell script to automate the backup of a Supabase PostgreSQL database using `pg_dump`.

## Features

- Exports **roles**, **schema**, and **data** into separate files.
- Automatically adds the current date to the file names.
- Launches Docker Desktop automatically before performing the backup (if required).
- Can be scheduled via Windows Task Scheduler.

---

## Requirements

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- Your SupaBase connection string.
- PostgreSQL client tools (`pg_dump`) and [Supabase CLI](https://supabase.com/docs/guides/local-development/cli/getting-started)

---

## Usage

1. Clone the repository or download the script and place it to any folder.:

```bash
git clone https://github.com/yourusername/supabase-backup-script.git
```

2. Open `backup.ps1` in a text editor and configure the following variables:

```powershell

$dockerPath = "your_path_to_dockerdesktop.exe"
cd "path_to_backup_folder"
npx supabase db dump --db-url "your-connection-string" --file "dump/roles_$date.sql" --role-only
npx supabase db dump --db-url "your-connection-string" --file "dump/schema_$date.sql" --debug
npx supabase db dump --db-url "your-connection-string" --file "dump/data_$date.sql" --debug --data-only --use-copy

You need to change these variables in order for the backup file to work properly.


```

3. Run the script manually from PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File .\backup.ps1
```

4. (Optional) Schedule the script using Windows Task Scheduler for automatic daily backups.

---

## Output

The script will create backup files in the specified folder:

- `roles-YYYY-MM-DD.sql`
- `schema-YYYY-MM-DD.sql`
- `data-YYYY-MM-DD.sql`

These files can later be used to **restore** your Supabase database.

---

## Notes

- Ensure Docker Desktop is installed and available before scheduling the script.
- The script automatically waits for Docker Desktop to be fully launched before running `pg_dump`.

---

## License

MIT
