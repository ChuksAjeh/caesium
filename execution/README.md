# Execution

To be implemented, after the matching engine is finished. The trader's
side of the market: works a large parent order as child orders across
several `engine` instances acting as venues. Covers the parent/child
order state machine, in-flight accounting so it can never overfill,
TWAP/VWAP strategies, smart order routing, pre-trade risk limits and
venue session recovery.

Talks to venues only over the wire protocol and never links `match`.
