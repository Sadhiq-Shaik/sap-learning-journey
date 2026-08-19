## Week 3 — Day 1

---

## ABAP Looping, Iteration & Loop Control

Learning Path: SAP ABAP on HANA / SAP S/4HANA
Week: 3
Day: 1
Focus: ABAP Control Flow & Repeated Data Processing
Status: ✅ COMPLETED

---

## 🎯 Today's Learning Objective

Today marked the beginning of Week 3 and the transition from basic ABAP syntax toward more practical programming logic.

The main objective was to understand how ABAP programs perform repeated processing and how developers control the execution of loops.

---


## Today's learning progression was:

ABAP Repetition
      ↓
DO Loop
      ↓
Iteration
      ↓
WHILE Loop
      ↓
Condition-Controlled Repetition
      ↓
EXIT
      ↓
CONTINUE
      ↓
CHECK
      ↓
Business-Oriented Loop Processing

---


## 📚 Modules Completed Today


Module : Module 1       

Topic  : DO Loop & Iteration

Status : ✅ Completed


Module : Module 2       

Topic  : WHILE Loop

Status : ✅ Completed



Module : Module 3       

Topic  : EXIT, CONTINUE & CHECK

Status : ✅ Completed

---




## 📖 Module 1 — DO Loop & Iteration

1. What is a Loop?

A loop is a programming mechanism that repeatedly executes a block of ABAP statements.

Loops become important when the same operation needs to be performed multiple times.

Instead of writing separate statements for every record or operation, the program can repeat the required logic.

## Conceptually:

Start
  ↓
Execute statements
  ↓
Repeat
  ↓
Execute again
  ↓
Continue until repetition is complete



2. Why Loops Matter in SAP

SAP business applications often process large amounts of data.

Examples include:

Customer records

Sales orders

Purchase orders

Inventory records

Vendor records

Invoice records

Employee records

Writing individual statements for hundreds or thousands of records would not be practical.

Loops allow ABAP programs to process repeated work efficiently.




3. DO Loop

The DO n TIMES statement is used when the required number of repetitions is known.

# Example:

```
DO 5 TIMES.
    WRITE 'Hello'.
ENDDO.

```

The block executes five times.




4. ENDLOOP Structure

A DO block is terminated using:

ENDDO.

This gives the pattern:

DO
 ↓
Statements
 ↓
ENDDO

Similar structures learned:

IF      → ENDIF
DO      → ENDDO
WHILE   → ENDWHILE




5. Iteration

An iteration is one complete execution of the loop body.

## For example:

DO 5 TIMES.

contains:

Iteration 1
Iteration 2
Iteration 3
Iteration 4
Iteration 5

Therefore:

One iteration = one execution of the repeated block.




6. DO Loop with a Counter

## Example:

```
DATA counter TYPE i.

DO 5 TIMES.
    counter = counter + 1.
    WRITE / counter.
ENDDO.

```

## Output:

1
2
3
4
5

This demonstrated how a loop can repeatedly modify a data object.


--- 



## 💼 Business Connection

A loop can later be used to process:

Purchase Order 1
Purchase Order 2
Purchase Order 3
...
Purchase Order N

The actual business records will become more important when working with internal tables.

---



## 🆚 IF vs DO

One important distinction learned:

IF
↓
Decision

DO
↓
Repetition

IF answers:

Should this block execute?

DO answers:

How many times should this block execute?

---



## 💻 Practical Task — Student Processing

I created a program to process five students using a DO loop.

```

DATA counter TYPE i.

WRITE 'STUDENT PROCESSING'.

DO 5 TIMES.
    counter = counter + 1.
    WRITE 'Student ' counter.
ENDDO.

```

## Conceptual output:

STUDENT PROCESSING
Student 1
Student 2
Student 3
Student 4
Student 5

Important learning

The repetition was produced by the loop rather than manually writing five separate output statements.

---



## 🏭 DO Loop Challenge — Procurement

I also applied the concept to a business-style scenario.

```

DATA counter TYPE i.

WRITE 'PROCUREMENT REQUEST PROCESSING'.

DO 10 TIMES.
    counter = counter + 1.
    WRITE 'Processing Request ' counter.
ENDDO.

```

This simulated processing ten procurement requests.

---



## 📖 Module 2 — WHILE Loop


7. What is a WHILE Loop?

A WHILE loop repeatedly executes a block of ABAP statements while a condition remains TRUE.

In simple terms:

Keep performing the operation while the condition is TRUE.

## Conceptually:

Start
  ↓
Check condition
  ↓
TRUE → Execute block
  ↓
Change data
  ↓
Check again
  ↓
FALSE → Stop




8. DO vs WHILE

This was one of the most important distinctions of the day.

DO

Used when the required number of repetitions is known.

DO 10 TIMES.

## Meaning:

Execute ten times.

WHILE

Used when repetition is controlled by a condition.

WHILE counter <= 10.

## Meaning:

Continue while the condition remains TRUE.

Mental model:

DO
→ "How many times?"

WHILE
→ "Until when?"




9. WHILE Syntax

Basic structure:

WHILE condition.
    " Statements
ENDWHILE.

ENDWHILE terminates the loop.




10. WHILE Example

```

DATA counter TYPE i.

counter = 1.

WHILE counter <= 5.
    WRITE / counter.
    counter = counter + 1.
ENDWHILE.

```

## Output:

1
2
3
4
5

The final value of counter becomes:

6

because the loop checks the condition again after the fifth iteration.




11. Zero-Iteration WHILE Loop

A WHILE loop can execute zero times if its initial condition is FALSE.

## Example:

```
DATA counter TYPE i.

counter = 10.

WHILE counter < 5.
    WRITE / counter.
    counter = counter + 1.
ENDWHILE.

```

The first condition check is:

10 < 5

which is FALSE.

Therefore:

0 iterations




⚠️ 12. Infinite Loop

An infinite loop can occur when the condition remains TRUE indefinitely.

## Example:

```

DATA counter TYPE i.

counter = 1.

WHILE counter <= 5.
    WRITE / counter.
ENDWHILE.

```

Here, counter never changes.

Therefore:

1 <= 5

remains TRUE.

Developer habit learned

Whenever I write a WHILE loop, I should ask:

What will eventually make the condition FALSE?


---



## 💰 Practical Task — Payment Processing

I created a business-oriented payment-processing program.

```

DATA remaining_balance TYPE i.

WRITE 'PAYMENT PROCESSING'.

remaining_balance = 30000.

WHILE remaining_balance > 0.
    WRITE / 'Remaining Balance = ' remaining_balance.
    remaining_balance = remaining_balance - 10000.
ENDWHILE.

WRITE / 'PAYMENT COMPLETED'.

```

## Expected processing:

PAYMENT PROCESSING
Remaining Balance = 30000
Remaining Balance = 20000
Remaining Balance = 10000
PAYMENT COMPLETED

This connected condition-controlled repetition with a practical business calculation.


---



## 🏭 WHILE Challenge — Procurement Processing

I created a second business-oriented example:

```

DATA remaining_quantity TYPE i.

WRITE 'PROCUREMENT PROCESSING'.

remaining_quantity = 50.

WHILE remaining_quantity > 0.
    WRITE / 'Remaining Quantity = ' remaining_quantity.
    remaining_quantity = remaining_quantity - 10.
ENDWHILE.

WRITE / 'PROCUREMENT REQUIREMENT FULFILLED'.

```

## Expected processing:

PROCUREMENT PROCESSING
Remaining Quantity = 50
Remaining Quantity = 40
Remaining Quantity = 30
Remaining Quantity = 20
Remaining Quantity = 10
PROCUREMENT REQUIREMENT FULFILLED

This demonstrated condition-controlled processing.

---



## 📖 Module 3 — EXIT, CONTINUE & CHECK

After learning how to repeat operations, I learned how to control what happens inside a loop.

## The three control statements studied were:

EXIT
CONTINUE
CHECK



## 13. EXIT

EXIT terminates the current loop immediately when execution reaches the EXIT statement.

In simple words:

EXIT = Stop the loop.

## Example:

```

DATA counter TYPE i.

counter = 1.

DO 10 TIMES.

    IF counter = 5.
        EXIT.
    ENDIF.

    WRITE / counter.
    counter = counter + 1.

ENDDO.

```

## Conceptually:

1 → Process
2 → Process
3 → Process
4 → Process
5 → EXIT
     ↓
   STOP



## 14. CONTINUE

CONTINUE skips the current iteration and continues with the next iteration.

In simple words:

CONTINUE = Skip this iteration and keep going.

## Example:

```
DATA counter TYPE i.

DO 5 TIMES.

    counter = counter + 1.

    IF counter = 3.
        CONTINUE.
    ENDIF.

    WRITE / counter.

ENDDO.

```

## Output:

1
2
4
5

The third iteration is skipped, but the loop continues.



## 15. CHECK

CHECK is used to continue processing when a specified condition is satisfied.

## Example concept:

CHECK marks >= 40.

At this stage, I learned to understand CHECK as a way of controlling processing based on a required condition.

Important distinction

CONTINUE
→ Explicitly skip the current iteration

CHECK
→ Continue processing only when the condition is satisfied

I also learned that CHECK has broader ABAP semantics depending on context, so its behavior needs to be understood according to where it is used.



## 🆚 EXIT vs CONTINUE vs CHECK

Statement : EXIT

Purpose   : Terminates the loop

Statement : CONTINUE

Purpose   : Skips the current iteration


Statement : CHECK

Purpose   : Continues processing only when the condition is satisfied




## Mental model:

EXIT
↓
STOP

CONTINUE
↓
SKIP CURRENT ITERATION
↓
NEXT ITERATION

CHECK
↓
CONDITION
↓
PROCESS ONLY IF SATISFIED

---



## 💻 Practical Task — Employee Processing

I created an employee-processing program using CONTINUE.

```
DATA processing_employee TYPE i.

WRITE / 'EMPLOYEE PROCESSING'.

DO 5 TIMES.

    processing_employee = processing_employee + 1.

    IF processing_employee = 3.
        CONTINUE.
    ENDIF.

    WRITE / 'Processing Employee = ' processing_employee.

ENDDO.

WRITE / 'EMPLOYEE PROCESSING IS COMPLETED'.
```


## Expected output:

EMPLOYEE PROCESSING
Processing Employee = 1
Processing Employee = 2
Processing Employee = 4
Processing Employee = 5
EMPLOYEE PROCESSING IS COMPLETED

Employee 3 is skipped while the remaining employees continue processing.

---



## 🏭 Procurement Challenge — CONTINUE

I implemented the invalid-request scenario using CONTINUE.

```

DATA procurement_request TYPE i.

WRITE / 'PROCUREMENT REQUEST LIST'.

DO 10 TIMES.

    procurement_request = procurement_request + 1.

    IF procurement_request = 5.
        CONTINUE.
    ENDIF.

    WRITE / 'Request = ' procurement_request.

ENDDO.

WRITE 'PROCUREMENT REQUEST PROCESS IS COMPLETED'.

```

## Conceptual processing:

Request 1 ✅
Request 2 ✅
Request 3 ✅
Request 4 ✅
Request 5 ❌ Skipped
Request 6 ✅
Request 7 ✅
Request 8 ✅
Request 9 ✅
Request 10 ✅

This demonstrated the correct use of CONTINUE when only one record is invalid but remaining records should continue processing.

---



## 🛑 Procurement Challenge — EXIT

I then created a second version where request 5 contains a critical error.

```

DATA procurement_request TYPE i.

WRITE / 'PROCUREMENT REQUEST LIST'.

DO 10 TIMES.

    procurement_request = procurement_request + 1.

    IF procurement_request = 5.
        EXIT.
    ENDIF.

    WRITE / 'Request = ' procurement_request.

ENDDO.

WRITE 'PROCUREMENT REQUEST PROCESS IS COMPLETED'.

WRITE 'In Procurement Request, there is a critical request error at request 5, so that is why there is only 4 procurement request'.

```

## Processing behavior:

Request 1 ✅
Request 2 ✅
Request 3 ✅
Request 4 ✅
Request 5 → EXIT
Request 6 ❌
Request 7 ❌
Request 8 ❌
Request 9 ❌
Request 10 ❌

## Therefore:

Only Requests 1–4 are processed because the critical error at Request 5 terminates the loop.

This demonstrated the practical difference between CONTINUE and EXIT.

---



## 🎤 Interview Preparation

I answered interview questions throughout all three modules.

Topics Covered

Loops

Iteration

DO

WHILE

ENDDO

ENDWHILE

EXIT

CONTINUE

CHECK

Infinite loops

Zero-iteration loops

Count-controlled repetition

Condition-controlled repetition

Loop control

Business-oriented loop processing

---



## Interview Performance

Module  : Module 1 — DO Loop

Score   : 8.5/10

Module  : Module 2 — WHILE Loop

Score   : 9/10

Module  : Module 3 — Loop Control

Score   : 9.5/10


## Day Average  : ≈ 9.0/10

The main improvement area was refining technical wording, especially distinguishing DO n TIMES from condition-based looping.

---


🧪 Quiz Performance

Module  : Module 1 — DO Loop

Score   : 9/10


Module  : Module 2 — WHILE Loop

Score   : 10/10


Module  : Module 3 — Loop Control

Score   : 10/10


## Overall Quiz Performance

███████████████████░  29/30

Overall: 96.7%

---



## ⚠️ Mistakes & Corrections

Today provided several useful programming lessons.

1. DO n TIMES Terminology

I initially described DO in a way that sounded condition-controlled.

The better professional distinction is:

DO n TIMES is count-controlled repetition, while WHILE is condition-controlled repetition.



2. Iteration Definition

I refined my understanding that:

One iteration means one complete execution of the loop body.



3. Missing Initialization / Incorrect Data Object

In my first procurement WHILE challenge, I declared one data object but used another.

The correction was:

DATA remaining_quantity TYPE i.

remaining_quantity = 50.

This taught me the importance of:

Correct declaration

Correct initialization

Consistent data-object naming



4. Understanding EXIT

I refined the understanding that EXIT does not wait for some separate loop condition by itself.

Instead:

When program execution reaches EXIT, the current loop is terminated immediately.



5. Business Logic vs Syntax

Today's exercises demonstrated that technically valid code is only part of the solution.

The program must also correctly represent the business requirement.



## 🏆 Major Achievements of W3-D1

## Technical

✅ Learned DO loop

✅ Learned iteration

✅ Learned WHILE

✅ Learned ENDWHILE

✅ Learned zero-iteration behavior

✅ Learned infinite loops

✅ Learned EXIT

✅ Learned CONTINUE

✅ Learned CHECK

✅ Distinguished count-controlled and condition-controlled repetition

✅ Learned loop-control behavior

## Practical

✅ Student-processing loop

✅ Procurement-request loop

✅ Payment-processing WHILE loop

✅ Procurement quantity WHILE loop

✅ Employee processing with CONTINUE

✅ Procurement processing with CONTINUE

✅ Procurement processing with EXIT

✅ Combined business logic scenarios

---



## 📊 W3-D1 Progress

Module 1 — DO Loop
████████████████████ 100% ✅

Module 2 — WHILE Loop
████████████████████ 100% ✅

Module 3 — EXIT / CONTINUE / CHECK
████████████████████ 100% ✅

W3-D1
████████████████████ 100% ✅

---



## 🧠 What I Learned Today

Today's core learning can be summarized as:

DO
→ Repeat a known number of times

WHILE
→ Repeat while a condition is TRUE

IF
→ Make a decision

EXIT
→ Stop the loop

CONTINUE
→ Skip the current iteration

CHECK
→ Continue processing when a condition is satisfied

---



## 💼 Business Logic Connection

Today's biggest development was connecting loop control to business scenarios.

## For example:

Invalid Request
      ↓
CONTINUE
      ↓
Process remaining requests

Whereas:

Critical Request Error
      ↓
EXIT
      ↓
Stop processing

This helped me understand that ABAP programming is increasingly about implementing business rules, rather than simply writing syntax.



## 💭 Personal Reflection

W3-D1 was an important step forward in my programming development.

Week 2 introduced me to basic ABAP programming.

Today, I started understanding program execution flow.

## Instead of only writing:

Declare
Assign
Calculate
Write

## I am now thinking in terms of:

Repeat
      ↓
Evaluate
      ↓
Decide
      ↓
Process
      ↓
Skip / Stop / Continue
      ↓
Repeat

The procurement scenarios were especially useful because they demonstrated how the same loop can behave differently depending on the business requirement.

## I also learned an important professional habit:

Don't just ask whether the code runs. Ask whether the code correctly represents the business requirement.

---



## 🎯 W3-D1 Skill Progression

Week 2
ABAP Statements
      ↓
Variables
      ↓
Expressions
      ↓
Conditions

Week 3 Day 1
      ↓
DO
      ↓
WHILE
      ↓
Iteration
      ↓
EXIT / CONTINUE / CHECK
      ↓
Business-Oriented Loop Control

This is the beginning of more realistic ABAP data processing.



## 🚀 Next Learning Direction

The next stage will move from basic loop control toward processing actual collections of data.

## The important progression will be:

Loops
   ↓
Multiple Records
   ↓
Internal Tables
   ↓
Work Areas / Structures
   ↓
LOOP AT
   ↓
Read / Modify / Process Records
   ↓
Business Data Processing

This is where ABAP programming will begin to resemble much more realistic enterprise data processing.

---



## 🏁 W3-D1 Completion

✅ WEEK 3 — DAY 1 COMPLETED

Modules: 3/3 ✅

Interview Average: ~9.0/10

Quiz: 29/30 — 96.7%

Practical Programs: ✅ Completed

Business Challenges: ✅ Completed

Control Flow Foundation: 🟢 Strong

Overall Status: 🟢 Excellent Progress

---


## 🔥 Key Takeaway

DO and WHILE control repetition. IF makes decisions. EXIT, CONTINUE, and CHECK control what happens inside the repetition.

Today I took another step from learning ABAP syntax toward thinking like an ABAP developer.
