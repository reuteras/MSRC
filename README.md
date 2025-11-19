# MSRC

This version of the MSRC script by [JohnLaTwC](https://github.com/JohnLaTwC/MSRC) has some modification for use in a Docker container.

## Get API key

You have to login to the MSRC Portal to get an API key.

Sign-in in here: [https://portal.msrc.microsoft.com/en-us/developer](https://portal.msrc.microsoft.com/en-us/developer), and click on the Developer tab, click the Show button on the API key.

## Automated Monthly Updates

This repository includes a GitHub Actions workflow that automatically generates MSRC CVE reports on the 15th of each month (after Patch Tuesday).

### Setup

1. Add your MSRC API key as a GitHub Actions secret:
   - Go to your repository settings
   - Navigate to Secrets and variables → Actions
   - Create a new repository secret named `MSRC_API_KEY`
   - Paste your API key as the value

2. The workflow will run automatically every month and commit the new report to the `Reports/` directory.

### Manual Execution

You can also trigger the workflow manually for any specific month:

1. Go to the Actions tab in your repository
2. Select "Monthly MSRC Data Update" workflow
3. Click "Run workflow"
4. Optionally specify a year (YYYY) and month (Jan/Feb/Mar/etc) to generate a specific report
5. Leave fields empty to generate the current month's report

## Manual Usage

For local execution:

    git clone https://github.com/reuteras/MSRC.git
    cd MSRC
    # Add your api key to a file named api.txt i the current directory
    ./run.sh

