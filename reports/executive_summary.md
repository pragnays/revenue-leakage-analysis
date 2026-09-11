
# Revenue Leakage Analysis — Executive Summary

## Business Problem

Olist, a Brazilian e-commerce marketplace, processes orders across thousands of sellers.
This analysis investigates where the business is losing revenue and customer trust due to
delivery performance issues, and identifies which product categories and time periods are
most at risk.

## Key Findings

1. **Delivery delays strongly damage customer experience.** Late-delivered orders (6.57% of
   all orders) average a review score of 2.25/5, compared to 4.13/5 for on-time orders — a
   46% drop. These late orders represent $1.37M in revenue tied to a damaged customer
   experience.
2. **Repeat purchase behavior is low platform-wide, regardless of review score (6-8%).**
   This suggests Olist's core risk isn't repeat-customer churn, but immediate transaction-level
   dissatisfaction, cancellations, and refund/dispute risk driven by delivery failures.
3. **Ten product categories account for the bulk of delay-driven revenue at risk**, led by
   Health & Beauty ($122.9K), Bed/Bath/Table ($119.5K), and Furniture & Decor ($108.6K) —
   together representing over $350K in revenue tied to late deliveries.
4. **Delivery-related revenue risk spikes sharply during demand surges.** November 2017
   (Black Friday period) saw late-order revenue jump to $174.7K, roughly 4-5x a typical month,
   indicating the logistics network struggles to scale during peak demand.

## Recommendations

1. **Prioritize logistics/carrier review for the top 3 at-risk categories** (Health & Beauty,
   Bed/Bath/Table, Furniture & Decor) — these carry the highest dollar exposure to delay-driven
   dissatisfaction.
2. **Build in seasonal logistics capacity buffers ahead of known demand spikes** (Black Friday,
   Nov; Carnival period, Feb-March) to prevent delay spikes seen in 2017-2018 data.
3. **Investigate seller-level delivery performance** for sellers concentrated in the top-risk
   categories, since delays may be concentrated among a subset of underperforming sellers
   rather than spread evenly.

## Note on Data

Analysis based on the public Olist Brazilian E-Commerce dataset (Kaggle), covering ~99K orders
from Sept 2016 to Oct 2018. The final two months (Sept-Oct 2018) show a sharp drop-off due to
incomplete data collection, not an actual business decline.
