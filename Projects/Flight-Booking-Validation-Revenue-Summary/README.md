# Flight Booking Validation & Revenue Summary

An ABAP console program that validates a list of flight bookings, rejects bad records with a reason, and reports revenue per carrier and currency from the valid, confirmed bookings only.

**Version:** v1.0 (original implementation, tag `v1.0`)
**Environment:** SAP S4D400 practice system, ABAP Development Tools (Eclipse)
**Class:** `ZCL_58_FLIGHT_BOOKING` (run as an ABAP console application)

## Business problem

A sales operations analyst receives booking records from several sales channels and needs a revenue figure per carrier before month-end reporting. Bad records distort that figure:

- duplicate booking IDs inflate revenue
- zero or negative fares distort totals
- cancelled bookings counted as revenue overstate it

Checking this by eye in a spreadsheet is slow and error-prone. This program does the checks the same way every time and explains every rejection.

## What v1 does

1. Loads 12 hard-coded test bookings (synthetic data; passenger names are placeholders).
2. Validates each booking and records a result (`V` valid / `R` rejected) with a rejection reason.
3. Counts total, valid, rejected, cancelled and revenue-eligible bookings.
4. Sums revenue per carrier and currency for valid bookings with status `C` (confirmed).
5. Prints a report: validation summary, rejection list, revenue summary.

## Rules as implemented in v1

| Check | Rejection reason |
|---|---|
| Booking ID already seen earlier in the list | `DUPLICATE_BOOKING_ID` |
| Carrier blank | `MISSING_CARRIER` |
| Connection blank | `MISSING_CONNECTION` |
| Flight date blank | `MISSING_FLIGHT_DATE` |
| Passenger count 0 or less | `INVALID_PASSENGER_COUNT` |
| Fare 0 or less | `INVALID_FARE` |
| Currency blank | `MISSING_CURRENCY` |
| Status not `C` (confirmed) or `X` (cancelled) | `INVALID_STATUS` |

- Checks run in the order above; the first failure is reported.
- Valid bookings with status `X` are accepted but excluded from revenue.
- Revenue is summed per carrier and currency, never across currencies.
- In v1, revenue per booking is calculated as `passenger_count * fare`.

## Data model

| Field | ABAP type |
|---|---|
| Booking ID | `c LENGTH 10` |
| Passenger name | `string` |
| Carrier ID | `/DMO/CARRIER_ID` |
| Connection ID | `/DMO/CONNECTION_ID` |
| Flight date | `d` |
| Passenger count | `i` |
| Fare | `p LENGTH 8 DECIMALS 2` |
| Currency | `c LENGTH 3` |
| Status | `c LENGTH 1` |

Three internal tables: bookings (input), validation results (one line per booking), revenue summary (one line per carrier and currency).

## ABAP techniques used

Global class with `IF_OO_ADT_CLASSRUN`, structured types and table types, `APPEND`, `CLEAR`, `LOOP AT ... INTO ... WHERE`, `READ TABLE ... WITH KEY` and `TRANSPORTING NO FIELDS`, `sy-subrc`, `CONTINUE`, `IF / ELSEIF`, `MODIFY ... INDEX sy-tabix`, string templates, `lines( )`.

## How to run

1. Create the global class `ZCL_58_FLIGHT_BOOKING` in ADT and paste in `src/zcl_58_flight_booking.clas.abap`.
2. Activate it.
3. Run it as an ABAP application (console).

The data types `/DMO/CARRIER_ID` and `/DMO/CONNECTION_ID` come from the course system. If your system does not have them, replace them with plain character types.

## Execution evidence

v1 was activated and run as a console application on the S4D400 system. The full output is in `docs/v1-console-output.txt`.

| Measure | Result |
|---|---|
| Total bookings | 12 |
| Valid | 7 |
| Rejected | 5 (`B002`, `B005`, `B007`, `B010`, second `B003`) |
| Cancelled (valid) | 1 |
| Revenue eligible | 6 |

## Known issues in v1

Issues 1 and 2 were confirmed by running v1 (see `docs/v1-console-output.txt`). Issues 3 to 5 come from reading the code. All are addressed in the next version.

1. **Currency list not enforced (confirmed).** Only a blank currency is rejected. The business rule allows INR, EUR and USD, but booking `B009` (GBP) passed validation and appears in the revenue summary as `LH / GBP / 650.00`. This is why the run shows 7 valid and 5 rejected, not 6 and 6.
2. **Revenue assumption (confirmed).** `passenger_count * fare` assumes the fare is per passenger. The original requirement treated the fare as the price of the booking, and this assumption was not documented. The effect is visible in the output: `AI / INR` shows 20000.00 (two bookings of 2 passengers each) and `LH / USD` shows 1800.00 (one booking of 3 passengers). Under a per-booking fare these would be 10000.00 and 600.00.
3. **Duplicate check scans a standard table line by line,** which slows down as the list grows.
4. **Repeated code.** The same seven field assignments are copied into nine places, so a change can easily be missed in one of them.
5. **Result structure omits** connection ID and flight date.

## Next version (planned)

A refactor that enforces the currency rule, documents the fare assumption, uses a hashed table for duplicate detection, aggregates with `COLLECT`, and builds each result line in one place. The refactor will be AI-assisted, with every change reviewed and explained by the author, and the before/after will be visible in the Git history.
