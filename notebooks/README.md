# **Notebooks for Hygiene Product Analysis Project** 📓

## **Overview**  
This folder contains a Jupyter notebook for performing the **data analysis** and **machine learning** tasks in the **Hygiene Product Analysis Project**. The notebook integrates **PCA (Principal Component Analysis)** and **K-Means clustering** to provide actionable insights into student hygiene product requests and preferences.

## **Contents of the Notebook**  
1. **`hygiene_students.ipynb`**:  
   - This notebook performs **Principal Component Analysis (PCA)** for dimensionality reduction on the processed hygiene product data, identifying key features that explain the most variance in the data.
   - It also implements **K-Means clustering** to group students based on their hygiene product requests, identifying distinct clusters with different product preferences.
   - **Key sections** include:
     - **PCA Analysis**: Visualizes the data distribution along principal components.
     - **K-Means Clustering**: Selects the optimal number of clusters using the **Elbow method** and **Silhouette score**, and visualizes clustered results. Insights include:
       - Cluster 1: High demand for basic hygiene products.
       - Cluster 2: Balanced product preferences across categories.
       - Cluster 3: Focus on personal care items.

## **How to Use**  
- **Run the notebook**:  
   - Open `hygiene_students.ipynb` in **Jupyter Notebook** or **JupyterLab**.
   - Make sure to install the necessary dependencies (listed below).
   - Run each cell sequentially to perform the data analysis and clustering tasks, starting from data preprocessing to clustering results and visualizations.
  
- **Customization**:  
   - Modify the number of clusters in K-Means or adjust PCA settings for different analysis perspectives.
   - You can explore different product categories or student clusters by adjusting the analysis inputs.

## **Dependencies**  
Ensure that the following libraries are installed:
```bash
pip install pandas numpy matplotlib seaborn scikit-learn
```

- **pandas**: For data manipulation and processing.
- **numpy**: For numerical operations and array handling.
- **matplotlib** & **seaborn**: For visualizations.
- **scikit-learn**: For PCA and K-Means clustering.

## **Next Steps**  
- After completing the PCA and K-Means analysis, use the clustered data to make informed decisions about inventory management, student preferences, and targeted campaigns.
- Regularly monitor trends and adjust product offerings based on the clustered groups to better cater to student needs.
