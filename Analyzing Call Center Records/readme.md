# Call Center Data Analysis and Cleaning SQL Script

This repository contains SQL queries designed for data cleaning, analysis, and exploration of a **call center** dataset. The queries are intended to clean raw data and provide valuable insights for business intelligence and decision-making.
## Purpose

The primary goal of this SQL script is to:

1. **Clean and preprocess** the raw data (e.g., correcting date formats, handling empty fields).
2. Provide **summary statistics** such as min, max, and average values for call durations and customer satisfaction (CSAT) scores.
3. Conduct a variety of **data analyses** to identify trends and patterns in the call center operations, such as:
   - Number of calls per day of the week
   - Distribution of call volumes across cities
   - CSAT score analysis
   - Call duration analysis
### Data Cleaning

1. **Changing Date Format:**
   - Converts the `call_timestamp` from the format `%m/%d/%Y` to a standard `DATE` format.
   
2. **Updating Empty Values:**
   - Replaces empty strings in the `csat_score` column with `NULL` values.

3. **Count Rows and Columns:**
   - Retrieves the number of rows and columns in the `call center` table.

### Distinct Value Analysis

1. **Distinct Values in Each Column:**
   - Finds all unique values for the following columns:
     - `sentiment`
     - `reason`
     - `city`
     - `channel`
     - `call_center`

### Aggregated Metrics

1. **Count and Percentage of Distinct Values:**
   - Provides a breakdown of how many times each distinct value appears in the `city` column, along with its percentage relative to the total number of rows.

2. **Call Count by Day of the Week:**
   - Counts the number of calls received on each day of the week (e.g., Monday, Tuesday, etc.).

3. **Call Duration Statistics:**
   - Computes the minimum, maximum, and average call duration in minutes.

4. **CSAT Score Analysis:**
   - Computes the minimum, maximum, and average CSAT score, excluding `0` values (which might represent missing or unfilled data).

### Call Center Insights

1. **Call Count by Response Time and Call Center:**
   - Analyzes how many calls occurred for each combination of `response_time` and `call_center`.

2. **Maximum Call Duration Per Day:**
   - Identifies the day with the longest call duration for each day in the dataset.
