# indiana-covid

A collection of Bash scripts to allow analysis of Indiana's official COVID statistics.

## Usage

Below is some examples using the scripts below.

**Deaths in County on a given date.**

This command requires 2 positional parameters.

1. The name of the county
2. The date formatted as YYYY-MM-DD

```
bash ./get-county-deaths-by-date.sh Marion 2020-07-04
```

**Deaths in County for the last X amount of days.**

This command requires 2 positional parameters.

1. The name of the county
2. The number of days ago as positive integer.

```
bash ./get-daily-cases-last-x-days-by-county.sh Marion 4
```


