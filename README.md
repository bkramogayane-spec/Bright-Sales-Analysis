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
