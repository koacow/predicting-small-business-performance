# Small Business Success Factors

## Overview

This project explores how local factors influence small business success using data from the Yelp Open Dataset. By analyzing business attributes, restaurant hours, ratings, and location data, we aim to identify key predictors of business performance and survival across different U.S. regions. 

## Team Members

- Khoa Cao (kcao@bu.edu)
- John Kim (jjk29@bu.edu)
- Laurel Purcell (lgp116@bu.edu)
- Patty Huang (pattyh@bu.edu)

## Objectives

- Analyze Yelp business data to understand what factors contribute to successful small businesses.

- Investigate how geography, customer sentiment, and business attributes relate to success.

- Build predictive models to estimate business outcomes such as:
    - Average rating
    - Review volume
    - Business longevity or closure likelihood

## Data Sources

The dataset includes millions of records across multiple tables from the Yelp dataset (https://business.yelp.com/data/resources/open-dataset/) such as:
- business.json – Business metadata (location, category, attributes)
- review.json – User reviews and star ratings
- user.json – User information and engagement metrics
- checkin.json – Customer check-in patterns
- tip.json – User tips and recommendations

We will also use the following supplemental data sources:
- Bureau of Labor Statistics (https://www.bls.gov/lau/tables.htm#cntyaa) - County-wide labor force and unemployment rate
- BEA (https://apps.bea.gov/regional/downloadzip.htm) - County-wide GDP and/or personal income

## Data Visualization

To uncover insights into business performance, we will employ:

- Exploratory Data Analysis (EDA):
    - Distribution of ratings, reviews, and categories
    - Temporal trends in business openings and closures
    - Correlation between features such as location, hours, and ratings
- Visualizations:
    - Bar charts comparing top-performing categories and cities
    - Geographic heatmaps showing business density and success rates
    - Scatter plots exploring relationships (e.g., number of reviews vs. rating)
    - Sentiment analysis word clouds from review text

## Machine Learning Techniques

- Regression analysis (e.g., linear regression, ridge, lasso) to predict continuous outcomes like star ratings or review counts
- KMeans, DBSCAN - group businesses by success profiles or regional pattern
- Classification (logistic regression, random forest) to predict binary outcomes such as business survival (open vs. closed)
- NLP Techniques (sentiment analysis, topic modeling) to extract insights from customer reviews 

## Test Plan

To ensure robust and fair model performance, we will apply:
    - Train-Test Split (80/20) — for generalization testing
    - Cross-Validation — for performance stability
    - Evaluation Metrics:
        - Regression: MAE, MSE, R²
        - Classification: Accuracy, Precision, Recall, F1 Score, ROC-AUC
        - Clustering: Silhouette Score


