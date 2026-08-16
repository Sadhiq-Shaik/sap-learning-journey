# Week 2 — Day 6
## ABAP Conditional Statements

**Learning Path:** SAP ABAP on HANA / S/4HANA  
**Focus:** ABAP Programming Fundamentals  
**Status:** ✅ Completed

---

## 🎯 Today's Learning Objective

Today I learned how ABAP programs make decisions using conditional statements.

The main objective was to understand how to use:

- IF
- ELSEIF
- ELSE
- ENDIF
- Comparison operators
- Business conditions
- Business decision logic

I also learned how a real-world business requirement can be translated into executable ABAP logic.

---

# 📚 What I Learned Today

## 1. Conditional Statements

A conditional statement allows an ABAP program to make a decision based on whether a condition evaluates to TRUE or FALSE.

In simple words:

> If a condition is true, execute one block of statements; otherwise, execute another block.

Example:

    IF marks >= 40.
        WRITE 'Student Passed'.
    ELSE.
        WRITE 'Student Failed'.
    ENDIF.

---

## 2. IF Statement

The IF statement is used to execute a block of statements when a specified condition evaluates to TRUE.

Basic structure:

    IF condition.
        " Statements
    ENDIF.

---

## 3. ELSE Statement

The ELSE statement is executed when the IF condition evaluates to FALSE.

Example:

    IF marks >= 40.
        WRITE 'Student Passed'.
    ELSE.
        WRITE 'Student Failed'.
    ENDIF.

---

## 4. ELSEIF Statement

ELSEIF is used when multiple conditions need to be evaluated.

Example:

    IF marks >= 90.
        WRITE 'Excellent'.
    ELSEIF marks >= 75.
        WRITE 'Very Good'.
    ELSEIF marks >= 60.
        WRITE 'Good'.
    ELSEIF marks >= 40.
        WRITE 'Pass'.
    ELSE.
        WRITE 'Fail'.
    ENDIF.

The conditions are evaluated from top to bottom.

Once a condition evaluates to TRUE, its corresponding block is executed and the remaining conditions are not evaluated.

---

## 5. Comparison Operators

Today I learned the following comparison operators:

| Operator | Meaning                  |
|----------|--------------------------|
| =        | Equal to                 |
| <>       | Not equal to             |
| <        | Less than                |
| >        | Greater than             |
| <=       | Less than or equal to    |
| >=       | Greater than or equal to |

Example:

    IF marks >= 40.

This means:

> Check whether the value of marks is greater than or equal to 40.

---

# 🧠 Important Concept Learned

## Order of Conditions Matters

I learned that the order of IF and ELSEIF conditions is extremely important.

For example, this logic is problematic:

    IF marks >= 40.
        WRITE 'Pass'.
    ELSEIF marks >= 75.
        WRITE 'Very Good'.
    ENDIF.

If:

    marks = 85

then:

    85 >= 40

is already TRUE.

Therefore, the program executes `Pass` and never reaches the `ELSEIF`.

A better approach is:

    IF marks >= 90.
        WRITE 'Excellent'.
    ELSEIF marks >= 75.
        WRITE 'Very Good'.
    ELSEIF marks >= 60.
        WRITE 'Good'.
    ELSEIF marks >= 40.
        WRITE 'Pass'.
    ELSE.
        WRITE 'Fail'.
    ENDIF.

This taught me that programming logic must be designed carefully according to the business requirement.

---

# 💼 Business Logic Connection

Today I learned that ABAP programming is not only about syntax.

ABAP can convert real-world business rules into executable program logic.

Examples include:

- Student result evaluation
- Stock availability
- Procurement decisions
- Payment status
- Approval requirements
- Customer order processing

### Example Business Requirement

> If available stock is less than required quantity, procurement is required.

ABAP logic:

    IF available_stock < required_quantity.
        WRITE 'PROCUREMENT REQUIRED'.
    ELSE.
        WRITE 'SUFFICIENT STOCK AVAILABLE'.
    ENDIF.

This is an example of converting a business requirement into ABAP logic.

---

# 💻 Practical Program 1 — Student Result System

Today I created my first ABAP program using multiple conditional statements.

    DATA student_name TYPE string.
    DATA marks TYPE i.
    DATA result TYPE string.

    student_name = 'Sadhiq'.
    marks = 85.

    WRITE 'STUDENT MARKS RESULT'.
    WRITE 'Student Name = ' student_name.
    WRITE 'Marks = ' marks.

    IF marks >= 90.
        WRITE 'Result = EXCELLENT'.
    ELSEIF marks >= 75.
        WRITE 'Result = VERY GOOD'.
    ELSEIF marks >= 60.
        WRITE 'Result = GOOD'.
    ELSEIF marks >= 40.
        WRITE 'Result = PASS'.
    ELSE.
        WRITE 'Result = FAIL'.
    ENDIF.

### Expected Result

    STUDENT MARKS RESULT
    Student Name = Sadhiq
    Marks = 85
    Result = VERY GOOD

---

# 🏫 Practical Program 2 — School Procurement Decision

I also converted a school procurement requirement into ABAP logic.

Scenario:

    Required Quantity = 100
    Available Stock = 35

Business rule:

> If available stock is less than required quantity, procurement is required.

Program:

    DATA required_quantity TYPE i.
    DATA available_stock TYPE i.
    DATA result TYPE string.

    required_quantity = 100.
    available_stock = 35.

    IF available_stock < required_quantity.
        WRITE 'PROCUREMENT REQUIRED'.
    ELSE.
        WRITE 'SUFFICIENT STOCK AVAILABLE'.
    ENDIF.

The program evaluates:

    35 < 100

The condition is TRUE.

Therefore:

    PROCUREMENT REQUIRED

---

# 🎤 Interview Preparation

Today I successfully answered interview questions related to:

- Conditional statements
- IF
- ELSE
- ELSEIF
- Comparison operators
- Condition evaluation
- Ordering of conditions
- Translating business requirements into ABAP logic

### Interview Assessment

**Score: 9.5/10**

My strongest area was explaining why the order of conditions matters.

---

# 🧪 Quiz Assessment

**Score: 10/10**

All 10 quiz questions were answered correctly.

---

# ⚠️ My Mistakes and Areas for Improvement

### 1. ABAP terminology

I sometimes use phrases such as:

> "if the conditional logic is satisfies"

A more professional expression is:

> "if the condition evaluates to TRUE."

I need to improve my technical terminology.

### 2. IF/ELSE syntax

In one interview answer, I initially omitted periods after:

    ELSE.
    ENDIF.

I understand that ABAP statements generally require proper termination using a period.

### 3. Unassigned data object

In one example, I declared:

    DATA marks TYPE i.

but did not assign a value before using it in the IF statement.

I need to remember that a practical program should initialize or assign appropriate values before relying on them.

### 4. Independent coding

My logic is becoming stronger, but I still need more practice writing ABAP programs independently without guidance.

---

# 📈 Current Status After W2-D6

I can now:

- Explain basic SAP DDIC concepts
- Explain domains and data elements
- Explain transparent tables and structures
- Understand primary and foreign keys
- Explain table relationships
- Explain database views
- Explain search helps
- Explain lock objects
- Understand basic ABAP data types
- Understand data objects
- Differentiate variables and constants
- Follow meaningful naming conventions
- Write basic ABAP statements
- Declare data objects
- Assign values
- Perform arithmetic operations
- Use IF/ELSEIF/ELSE
- Use comparison operators
- Translate simple business rules into ABAP logic
- Write basic business-oriented ABAP programs

---

# 🏆 Today's Achievement

> Today I moved one step further from learning ABAP syntax toward thinking like an ABAP developer.

I successfully converted two real-world scenarios into ABAP logic:

1. Student Result Evaluation
2. School Procurement Decision

This is important because SAP development is fundamentally about implementing business requirements through software logic.

---

# 🧠 Personal Reflection

Today was an important day in my SAP journey.

Earlier, I was mainly learning SAP concepts, DDIC objects, data types and programming terminology.

Today I started making ABAP programs take decisions.

The most important realization from today's class is:

> ABAP is not simply about writing code. It is about converting business requirements into executable logic.

The school procurement example especially helped me connect programming with the type of real-world SAP application I want to eventually build.

I want to continue moving from:

    Learning Concepts
          ↓
    Writing Small Programs
          ↓
    Solving Business Problems
          ↓
    Building Real Applications
          ↓
    Building SAP Portfolio Projects

---

# 🎯 Week 3 Preview

In Week 3, I will continue strengthening my ABAP programming foundation.

The upcoming learning direction will include:

- More ABAP programming logic
- Additional control-flow concepts
- More practical coding exercises
- Internal tables
- Processing multiple records
- Database interaction fundamentals
- Open SQL concepts
- More realistic business scenarios
- Debugging and problem-solving practice

The exact sequence will be introduced progressively during the classes.

---

# 🔥 Key Takeaway

> "Learn the concept → understand the business requirement → write the logic → code it → test it → debug it → document the evidence."

---

## 🏁 W2-D6 Status

**✅ COMPLETED**

**Interview:** 9.5/10  
**Quiz:** 10/10  
**Practical Programs:** 2 completed  
**Business Logic:** Successfully implemented  
**Overall Status:** 🟢 Strong Progress
