# Predicting Labor Market Trends

## Overview

A group project aiming to use U.S. County-level census data and machine learning techniques to predict labor market trends such as unemployment rates, job growth, and vulnerable-worker disparities.

## Team Members

- Khoa Cao (kcao@bu.edu)
- John Kim (jjk29@bu.edu)
- Laurel Purcell (lgp116@bu.edu)
- Patty Huang (pattyh@bu.edu)

## Objectives

- Analyze U.S. County-level census data to identify patterns and trends in the labor market.
- Develop machine learning models to predict key labor market indicators such as unemployement rates and wages (average and median) by county and/or by industry.

## Data Sources

The project's dataset will be compiled from various public sources at the county-level in the U.S. and merged into a single dataset by county FIPS code (Federal Information Processing Standard code). The time frame for the data will be from 2010 to the most recent available year (2024).

- [U.S. Census Bureau](https://data.census.gov/) - Demographic and economic data
- [Bureau of Labor Statistics](https://www.bls.gov/) - Labor market data
- [Federal Reserve Economic Data (FRED)](https://fred.stlouisfed.org/) - Economic data (supplemental)
- Other relevant public datasets (e.g., education, health, infrastructure; if needed)

## Data Visualization

- Use correlation heatmaps to show linear relationships between variables
- Use time series plots to visualize trends
- Use geographic heatmaps to show geographic disparities
- Use bar charts to compare different demographic groups
- Use scatter plots to show correlations between variables (e.g., education level vs. unemployment rate, GDP growth vs. job growth)

## Machine Learning Techniques

- Regression analysis (e.g., linear regression) with regularization (Ridge, Lasso) - to predict continuous outcomes like unemployment rates and wages
- KMeans, DBSCAN - to identify clusters of counties with similar labor market characteristics
- Time series forecasting (ARIMA, Prophet) - to predict future trends in unemployment rates and wages
- Random Forest, Gradient Boosting Machines (GBM), XGBoost - to capture non-linear relationships and interactions between variables

## Test Plan

We will likely use a combination of the following methods to evaluate our models:

- Train-test split - randomly sample 10% of the data into a test set. This prevents biases from time-based splits (e.g., training on 2010-2020 and testing on 2021-2024 since the labor market was heavily affected by the COVID-19 pandemic).
- Cross-validation
- Evaluation metrics:

    - For regression tasks: Mean Absolute Error (MAE), Mean Squared Error (MSE), R-squared
    - For clustering tasks: Silhouette Score

