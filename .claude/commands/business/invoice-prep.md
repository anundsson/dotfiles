---
description: Prepare invoice data for a consulting engagement (Swedish format)
model: claude-sonnet-4-6
---

Prepare invoice details for the following work.

## Engagement Details

$ARGUMENTS

## Swedish Invoice Requirements

Generate invoice data including:
1. **Invoice number** — suggest next sequential number if series is provided
2. **Invoice date** and **due date** (standard 30 days unless specified)
3. **Seller details** — Anundio (prompt for org.nr, address if not known)
4. **Buyer details** — client company name, org.nr, address
5. **Line items** — description, quantity, unit (hours/days/fixed), unit price, total
6. **Subtotal** before moms
7. **Moms** — 25% for Swedish clients, reverse charge for EU, no moms for non-EU
8. **Total** including moms
9. **Payment details** — bankgiro/plusgiro/bank account
10. **References** — F-skattsedel note, momsregistreringsnummer, client reference/PO number

## Moms Rules
- **Swedish client**: 25% moms
- **EU client (B2B)**: Reverse charge — 0% moms, note "Omvänd skattskyldighet" and include client's VAT number
- **Non-EU client**: No moms — note "Export of services"

## Output

Generate structured invoice data in a format ready to enter into Bookio, plus a summary suitable for email to the client.
