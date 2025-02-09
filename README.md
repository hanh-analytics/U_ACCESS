# **Hygiene Product Analysis Project**  🧼🪥🧴🧻 🚿 🧽

## **Project Overview**  
This project provides a comprehensive analysis of hygiene product requests collected through U-ACCESS at UMass Boston in October 2024. The objective is to derive actionable insights to optimize inventory management, better meet student needs, and support data-driven decision-making.  


## **Key Features**  
- **Data Analysis:** Detailed exploration of student product requests and usage patterns.  
- **Visualization Dashboards:** Interactive Tableau dashboards highlighting key metrics, product trends, and category usage frequencies.  
- **Strategic Insights:** Recommendations for inventory management, product awareness campaigns, and stocking strategies.  


## **Repository Structure**  
- `data/`: Contains the raw and processed survey data.  
- `scripts/`: SQL scripts for data extraction, cleaning, and transformation.  
- `visualizations/`: Tableau workbooks for visualizations.  
- `reports/`: Final analysis report and presentation materials.  
- `README.md`: Project overview and documentation.
- `notebooks/`: Jupyter notebooks for K-Means clustering analysis and PCA visualization.


## **Data Description**  
The dataset includes:  
- **646 Student Survey Responses:** Unique participant IDs for survey tracking.  
- **960 Product Requests:** Covering 19 unique product categories such as toilet paper, laundry detergent, deodorant, shampoo, conditioner, and socks.  
- **Attributes:** Product categories, request combinations, and gender-based insights.


## **Key Insights**  
- **High Product Demand:** Toilet paper and laundry detergent rank as the top-requested items (243 requests each).  
- **Balanced Category Usage:** Equal demand across product categories highlights diverse student needs.  
- **Notable Gaps:** The significant difference between shampoo (160 requests) and conditioner (4 requests) suggests an opportunity to raise awareness about available products.  
- **Gender Preferences:** Slightly higher requests for socks and deodorants from women, indicating balanced yet nuanced stocking requirements.
- **K-Means Clustering Insights**:
Cluster Distribution: The K-Means clustering analysis segmented the students into 3 distinct clusters based on their product request patterns.
   - Cluster 1 (High demand for essentials): Students in this cluster showed higher demand for essential products like toilet paper, laundry detergent, and soap. This group represents students who prioritize basic hygiene needs.
   - Cluster 2 (Balanced preferences): Students in this cluster exhibited a more balanced demand across the product categories, with a slightly higher preference for personal care items like shampoo, lotion, and deodorant.
   - Cluster 3 (Personal care-focused): This group was more inclined towards personal care products, particularly higher requests for items like shaving cream, body wash, and face masks.
   - Inventory Recommendations: Based on the clustering results, inventory management can be optimized by ensuring stock levels match the distinct preferences of each cluster. Cluster 1 may require more essentials, while Cluster 3 may need more personal care products.


## **Usage Instructions**  
1. **Data Analysis:**  
   - Run the SQL scripts in `scripts/` to extract and clean data from the source database.  
2. **Dashboard Interaction:**  
   - Open the Tableau workbooks in `dashboards/` to explore interactive visualizations.  
3. **Reports:**  
   - Access comprehensive insights and recommendations in `reports/`.
4. **Clustering Analysis**:
   - Open the Jupyter notebooks in notebooks/ to explore K-Means clustering analysis and PCA visualizations.


## **Technologies Used**  
- **Data Analysis:** SQL  
- **Visualization:** Tableau  
- **Data Storage and Processing:** Excel
- **Clustering Analysis**: Python (Scikit-learn, pandas, NumPy, matplotlib, seaborn)


## **Recommendations**  
- Maintain strong stock levels for top-requested items like toilet paper and laundry detergent.  
- Create awareness campaigns for underutilized products like conditioner.  
- Consider bundling strategies for frequently requested product combinations (e.g., toilet paper and soap).  
- Monitor product trends regularly to adjust inventory and meet evolving student needs.


## **Author**  
Hanh Le   
Data Analyst | UMass Boston Hygiene Product Project  
