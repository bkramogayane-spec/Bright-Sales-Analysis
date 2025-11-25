# Bright-Sales-Analysis

# Sales Analysis Case Study

Daily retail sales analysis for a single product: derive unit pricing, gross profit metrics, and price elasticity insights; assess whether promotional pricing improves performance.

## Objectives
1. Daily sales price per unit  
2. Average unit sales price  
3. Daily % gross profit  
4. Daily % gross profit per unit  
5. Pick 3 promotion/special periods and estimate price elasticity of demand; assess performance under promo pricing  
6. Additional insights (visuals, reports, dashboards, KPIs)  
*(Objectives per the provided brief.)* 

## Dataset
- **Source**: `Sales Case Study.csv`
- **Fields**: `Date`, `Sales`, `Cost Of Sales`, `Quantity Sold`  
*(Column names as in the case study and CSV.)*

## Metrics
- Unit price (ZAR/unit): Sales / Quantity Sold
- Average unit price: (sum(Sales) / sum(Quantity))
- Daily Gross Profit & %: Sales - Cost Of Sales; %GP = GP / Sales
- GP per unit: GP / Quantity
- Promo periods: identified via significant price drop vs rolling baseline + quantity lift
- Elasticity (arc): E = (ΔQ / Q_avg) / (ΔP / P_avg) Compare promo vs matched pre‑promo baseline.

## Tools Used
Miro for project planning
Snowflake for coding
Microsoft Excel for Visualization & Insights
Microsoft PowerPoint for presentation (20 min) - including a Gantt Chart to show project phases
Google Looker for Dashboard mockup

## Findings
### Key Metrics & Performance
- Total Sales: ~R186.9 million
- Total Quantity Sold: 5,279,872 units
- Average Unit Price: R35.40
- Gross Profit Margin: -0.87% (costs slightly exceeded revenue, signaling need for cost optimization)

### Elasticity Analysis
- High Responsiveness: Elasticity = 2.90 (March–August) → Consumers highly sensitive to price changes.
- Inverse Relationship: Elasticity = -1.39 (Feb–Oct) → Possibly influenced by external factors.
- Minimal Responsiveness: Elasticity = 0.02 (Aug–Sept) → Price changes had negligible effect on demand.

### Insights
- Promotions significantly impacted demand during certain periods.
- Negative gross margin suggests pricing or cost structure issues.
- Correlation between price and quantity sold needs continuous monitoring.

### Strategic Recommendations
- Target Promotions during high elasticity periods for maximum impact.
- Investigate Negative Elasticity periods to uncover external influences.
- Improve Cost Structures to achieve positive margins.
- Monitor Price–Quantity Correlation to refine pricing strategies.
