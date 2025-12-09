# Small Business Success Factors

## Overview

This project explores how local factors influence small business success using data from the Yelp Open Dataset. By analyzing business attributes, restaurant hours, ratings, and location data, we aim to identify key predictors of business performance and survival across different U.S. regions. 

## Final Report


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
    - Business closure likelihood

## Data Sources

The dataset includes millions of records across multiple tables from the Yelp dataset (https://business.yelp.com/data/resources/open-dataset/) such as:
- business.json – Business metadata (location, category, attributes, average rating)
- review.json – User reviews and star ratings
- user.json – User information and engagement metrics
- checkin.json – Customer check-in patterns
- tip.json – User tips and recommendations

We will also use the following supplemental data sources:
- Bureau of Labor Statistics (https://www.bls.gov/lau/tables.htm#cntyaa) - Per-county labor force and unemployment rate
- BEA (https://apps.bea.gov/regional/downloadzip.htm) - Per-county GDP and/or personal income
- County shapefiles from US Census (https://www2.census.gov/geo/tiger/GENZ2018/shp/cb_2018_us_county_5m.zip) - To map businesses to counties

## How to Build and Run the Code

1. Clone the repository

git clone https://github.com/koacow/predicting-small-business-performance
cd predicting-small-business-performance

2. Install dependencies 

pip install -r requirements.txt

Open code.ipynb in Jupyter Notebook or JupyterLab and run all cells to compile the dataset  (business_economic_data.csv)
Then open exploratory_data_analysis.ipynb and run all cells to perform exploratory analysis, train models, and generate visualizations.

## Directory Structure

```bash
predicting-small-business-performance/
    ├── data/
    │   ├── Yelp JSON/
    │   │   └── yelp_dataset/
    │   │       └── yelp_academic_dataset_business.json
    │   │       └── yelp_academic_dataset_review.json
    │   ├── bea/
    │   │   └── CAGDP1__ALL_AREAS_2001_2023.csv
    │   └── bls/
    │       └── laucnty23.xlsx
    │   └── cb_2018_us_county_5m/
    │       └── cb_2018_us_county_5m.shp
    │── compile_dataset.ipynb
    └── business_economic_data.csv
```

## Testing and GitHub Workflow

For this project, the main “tests” are embedded directly in the notebooks. Running all cells in code.ipynb and exploratory_data_analysis.ipynb will:

In code.ipynb:
- The dataset is compiled from Yelp, BLS, BEA, and Census sources into business_economic_data.csv.
- Shape and column checks confirm successful compilation.
- Required columns include:
    - business_id
    - is_open
    - stars
    - review_count
    - labor_force
    - gdp

In exploratory_data_analysis.ipynb:
- Preprocessing steps (dropping missing values, normalizing features) are validated by running without errors.
- Classification reports for Decision Tree and KNN confirm models train successfully.
- Confusion matrices serve as validation of predictive performance.
- Visualizations (correlation heatmap, scatter plots, distributions) confirm data integrity and relationships.

## Visualizations

The notebooks generate a variety of plots to explore the data and evaluate models:
- Distributions of labor force, employed, unemployed, unemployment rate, GDP.
    - ![Labor force and employment](figures/LaborForce:Employment.png)
    - ![Unemployment rate and GDP](figures/UnemploymentRate_GDP.png)
- Distribution of labor force by business status (`is_open = 0` vs `is_open = 1`)  
    - ![Labor force distribution](figures/LaborForce_IsOpen.png)
- Distribution of unemployment rate by business status (`is_open = 0` vs `is_open = 1`)  
    - ![Unemployment rate distribution](figures/UnemploymentRate_IsOpen.png)
- Distribution of Yelp star ratings, review counts, business status
    - ![Star, review counts, business status distribution](figures/ReviewCount_IsOpen_Stars.png)
- Correlation matrix showing relationships among covariates and targets
    - ![Correlation matrix](figures/CorrelationMatrix.png)
- Scatter plots of unemployment rate vs GDP, colored by business status
    - ![Scatter plot](figures/UnemploymentRate_GDP.png)
- Confusion matrix for Decision Tree 
    - ![Decision Tree confusion matrix](figures/ConfusionMatrix_DT.png)
- Confusion matrix for KNN
    - ![KNN confusion matrix](figures/ConfusionMatrix_KNN.png)

## Data Processing and Modeling 

Data compilation:
- Yelp Business Dataset (business + reviews + tips), filtered to restaurants (~12,000 businesses).
- BLS LAUS (county-level labor force, employment, unemployment, unemployment rate).
- BEA CAGDP1 (county-level GDP).
- Census county shapefiles (geospatial joins using latitude/longitude → FIPS codes).

Feature engineering:
- Number of categories, number of attributes.
- Weekly hours and average daily hours derived from Yelp attributes.
- Review-based features: weighted average stars (by review length), weighted average review length, concatenated review text.
- Tip-based features: number of tips, weighted average tip length.

Preprocessing:
- Dropped irrelevant columns (business name, address, phone).
- Removed businesses missing county FIPS codes (~5% of rows).
- Normalized numerical features using min-max scaling.
- Final dataset: ~10,500 businesses × 25 features.
- Split into training/testing sets (80/20).

Modeling:
- Decision Tree Classifier (max depth = 10).
- K-Nearest Neighbors (k=10, Euclidean distance).
- Evaluation: accuracy (~77%), precision/recall/F1 via classification reports.
- Confusion matrices show strong recall for open businesses but weak recall for closed businesses due to class imbalance (85% open vs 15% closed).

## Results

Decision Tree:
- Accuracy: ~77%
- Recall (open businesses): 0.93
- Recall (closed businesses): 0.13
- Precision (open): 0.80, Precision (closed): 0.40
- F1 (open): 0.86, F1 (closed): 0.19
- Confusion matrix shows strong performance on open businesses but frequent misclassification of closed businesses.

K‑Nearest Neighbors:
- Accuracy: ~77%
- Recall (open businesses): 0.95
- Recall (closed businesses): 0.08
- Precision (open): 0.78, Precision (closed): 0.33
- F1 (open): 0.86, F1 (closed): 0.13
- Confusion matrix confirms bias toward predicting open businesses.

Key insights:
- Both models predict open businesses well but struggle with closed businesses due to class imbalance (85% open vs 15% closed).
- Decision Tree feature importance suggests `stars`, `review_count`, and `unemployment_rate` are most predictive.
Additional features (review sentiment, business age, income) are needed to improve negative class detection.



