# caret_babyweight_estimator
Predict baby weight in R

**Training and Serving CARET models using AI Platform Custom Containers**
**Overview**
This notebook illustrates how to use CARET R package to build an ML model to estimate the baby's weight given a number of factors, using the BigQuery natality dataset. We use AI Platform Training with Custom Containers to train the TensorFlow model at scale. Rhen use the Cloud Run to serve the trained model as a Web API for online predictions.

**Dataset**
The dataset used in this tutorial is natality data, which describes all United States births registered in the 50 States, the District of Columbia, and New York City from 1969 to 2008, with more than 137 million records. The dataset is available in BigQuery public dataset. We use the data extracted from BigQuery and stored as CSV in Cloud Storage (GCS) in the Exploratory Data Analysis notebook.

In this notebook goal is to predict the baby's weight given a number of factors about the pregnancy and the baby's mother.
