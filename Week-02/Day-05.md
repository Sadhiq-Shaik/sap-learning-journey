# Week 2 — Day 5
## ABAP Programming Foundations & First ABAP Programs

**Learning Path:** SAP ABAP on HANA / S/4HANA  
**Focus:** ABAP Programming Fundamentals  
**Status:** ✅ Completed

---

## 🎯 Today's Learning Objective

Today was a major milestone in my SAP ABAP journey.

The objective was to move from understanding ABAP concepts toward actually writing and understanding ABAP programs.

Today I learned:

- ABAP Statements
- ABAP Keywords
- Declaration
- Assignment
- Comments
- ABAP Syntax
- Variables
- Operators
- Operands
- Expressions
- Arithmetic Operations
- ABAP Output
- Basic Program Structure
- Practical ABAP Programming

Most importantly, I wrote and modified my first ABAP programs.

---

# 📚 What I Learned Today

## 1. ABAP Statements

An ABAP statement is an instruction given to the ABAP runtime to perform a particular operation.

An ABAP program may need to:

- Declare a data object
- Assign a value
- Perform calculations
- Read data
- Display information
- Make decisions
- Repeat an operation

These operations are represented using ABAP statements.

Most ABAP statements are terminated using a period (`.`).

Example:

    DATA student_name TYPE string.

---

## 2. ABAP Keywords

ABAP keywords are predefined words that have specific meanings in the ABAP programming language.

Examples include:

    DATA
    IF
    ELSE
    LOOP
    WRITE
    SELECT
    READ
    MODIFY
    DELETE

Example:

    DATA student_name TYPE string.

Here:

    DATA

is an ABAP keyword used to declare a data object.

---

## 3. Declaration

Declaration means informing ABAP that a data object is required and specifying its data type.

Example:

    DATA student_name TYPE string.

This can be understood as:

> "ABAP, I need a data object called `student_name`, and it should hold string data."

Declaration does not mean assigning the actual value.

---

## 4. Assignment

Assignment means giving a value to an already declared data object.

Example:

    student_name = 'Sadhiq'.

Here:

- `student_name` → Data object
- `'Sadhiq'` → Value
- `=` → Assignment operator

Therefore:

> Declaration creates/defines the data object, while assignment gives a value to it.

---

# 🧠 Declaration vs Assignment

Example:

    DATA marks TYPE i.

    marks = 95.

The first statement declares:

    marks

as an integer data object.

The second statement assigns:

    95

to the data object.

This distinction is important in ABAP programming.

---

# 5. Comments in ABAP

Comments are explanations written for developers.

They are not executed as normal program instructions.

Comments help explain:

- Why particular logic exists
- What a calculation does
- Important business rules
- Temporary development information
- Complex sections of code

Example:

    * This is a comment.

Another common form is an inline comment:

    DATA marks TYPE i. " Student marks

Comments are important in professional development because they help other developers understand the purpose of the code.

---

# 6. ABAP Case Sensitivity

ABAP is generally not case-sensitive for its keywords.

For example:

    DATA
    Data
    data

can generally represent the same keyword.

However, professional ABAP development normally follows a consistent coding style.

Example:

    DATA student_name TYPE string.

Consistency makes code easier to read and maintain.

---

# 7. ABAP Syntax

ABAP follows specific syntax rules.

The programming language needs to know:

- Where a statement begins
- What operation should be performed
- Where a statement ends
- How different elements are related

A period (`.`) generally terminates an ABAP statement.

Example:

    DATA marks TYPE i.
    marks = 95.
    WRITE marks.

The program processes the statements according to the program logic.

---

# 8. Variables

A variable is a data object that holds a value that can change during ABAP program execution.

Example:

    DATA marks TYPE i.

    marks = 80.
    marks = 95.

The data object remains:

    marks

but the value changes:

    80 → 95

Therefore:

> A variable holds a value that can change during program execution.

---

# 9. Assignment Operator

The `=` operator is used to assign a value or expression result to a data object.

Example:

    marks = 80.

This means:

> Assign the value `80` to the data object `marks`.

Another example:

    total_marks = maths + physics + chemistry.

Here the calculated result is assigned to:

    total_marks

---

# 10. Operators

Operators tell ABAP what operation needs to be performed.

Today I focused mainly on arithmetic operators.

| Operator | Operation |
|---|---|
| `+` | Addition |
| `-` | Subtraction |
| `*` | Multiplication |
| `/` | Division |

---

# 11. Operands

An operand is a value or data object on which an operator performs an operation.

Example:

    total_amount = quantity * price.

Here:

- `quantity` → Operand
- `price` → Operand
- `*` → Operator
- `total_amount` → Data object receiving the result

If:

    quantity = 5
    price = 500

then:

    total_amount = 5 * 500

Result:

    2500

---

# 12. Expressions

An expression is a combination of operands and operators that produces a value.

Example:

    total_marks = maths + physics + chemistry.

The expression:

    maths + physics + chemistry

performs an addition operation.

The result is then assigned to:

    total_marks

Another example:

    remaining_amount = total_amount - amount_paid.

The expression calculates the remaining amount.

---

# 13. Parentheses in Expressions

Parentheses can be used to explicitly control how an expression should be evaluated.

Example:

    result = (a + b) * c.

The parentheses indicate that:

    a + b

should be evaluated before multiplication by `c`.

This becomes particularly important when expressions contain multiple operations.

---

# 14. Statement vs Expression

Today I learned the difference between a statement and an expression.

### Statement

A statement is a complete instruction given to ABAP and is generally terminated with a period.

Example:

    total_marks = maths + physics + chemistry.

### Expression

The expression is the part that produces a value.

Example:

    maths + physics + chemistry

Therefore:

> An expression performs or represents a calculation, while a statement provides a complete instruction to the ABAP runtime.

---

# 💼 Business Logic Connection

Arithmetic operations are extremely important in business applications.

Businesses continuously perform calculations involving:

- Prices
- Quantities
- Payments
- Balances
- Stock
- Procurement
- Sales
- Taxes
- Salaries
- Financial transactions

For example:

    remaining_amount = total_amount - amount_paid.

This can represent a real business requirement:

> Calculate the remaining amount that a customer still needs to pay.

---

# 🔄 Business Example — Payment Processing

Suppose:

    Total Fee = 60000
    First Payment = 25000
    Second Payment = 15000

The remaining amount can be calculated using arithmetic operations.

Conceptually:

    remaining_fee = total_fee - first_payment - second_payment.

Calculation:

    remaining_fee = 60000 - 25000 - 15000

Result:

    20000

Therefore:

    Remaining Fee = 20000

This helped me understand how simple ABAP expressions can represent real business logic.

---

# 💻 My First ABAP Program

Today I wrote my first basic ABAP program.

Initial version:

    DATA student_name TYPE string.
    DATA marks TYPE i.
    DATA maximum_marks TYPE i.
    DATA percentage TYPE i.

    student_name = 'Lenny'.
    marks = 95.
    maximum_marks = 100.

    percentage = marks / 100 * 100.

    WRITE percentage.

This was my first step toward actually writing ABAP code rather than only learning theoretical concepts.

---

# 💻 My First Formatted ABAP Program

I then improved the program by adding multiple output statements.

    DATA student_name TYPE string.
    DATA marks TYPE i.
    DATA maximum_marks TYPE i.
    DATA percentage TYPE p.

    student_name = 'Lenny'.
    marks = 95.
    maximum_marks = 100.

    percentage = marks / maximum_marks * 100.

    WRITE 'Student Details Are : '.
    WRITE student_name.
    WRITE marks.
    WRITE maximum_marks.
    WRITE percentage.

    WRITE 'Good Student'.

This was an important moment because I started thinking about both:

1. Program logic
2. Output presentation

---

# 🧮 Student Payment Program

I also created a payment-related ABAP program.

    DATA student_name TYPE string.
    DATA total_fee TYPE p.
    DATA amount_paid TYPE p.
    DATA remaining_fee TYPE p.

    student_name = 'Sumaiya'.
    total_fee = 50000.
    amount_paid = 30000.

    remaining_fee = total_fee - amount_paid.

    WRITE 'Student Payment Details : '.
    WRITE 'Student Name: ' student_name.
    WRITE 'Total Fee: ' total_fee.
    WRITE 'Amount Paid: ' amount_paid.
    WRITE 'Remaining Fee: ' remaining_fee.

    WRITE 'COMPLETE THE REMAINING AMOUNT SOON'.
    WRITE 'THANK YOU'.

This program demonstrated:

- Declaration
- Assignment
- Variables
- Arithmetic operations
- Expressions
- Output

---

# 💻 Improved Student Payment Program

I then created a more detailed version with two payments.

    DATA student_name TYPE string.
    DATA total_fee TYPE i.
    DATA first_payment TYPE i.
    DATA second_payment TYPE i.
    DATA remaining_fee TYPE i.

    student_name = 'Sadhiq'.
    total_fee = 60000.
    first_payment = 25000.
    second_payment = 15000.

    remaining_fee = total_fee - first_payment - second_payment.

    WRITE 'STUDENT PAYMENT DETAILS : '.
    WRITE 'Student Name = ' student_name.
    WRITE 'Total Fees Amount = ' total_fee.
    WRITE 'First Payment = ' first_payment.
    WRITE 'Second Payment = ' second_payment.
    WRITE 'Balance Amount to Pay = ' remaining_fee.

    WRITE 'COMPLETE THE REMAINING AMOUNT SOON'.
    WRITE '------THANK YOU------'.

Expected calculation:

    60000 - 25000 - 15000 = 20000

Therefore:

    Balance Amount to Pay = 20000

---

# 🧠 Important Correction

While writing my payment program, I initially wrote:

    remaining_fee = total_fee - first_payment + second_payment.

I realized that this does not represent the intended business logic.

The correct logic for two payments already made is:

    remaining_fee = total_fee - first_payment - second_payment.

Therefore:

    60000 - 25000 - 15000 = 20000

This was an important practical lesson:

> Correct syntax is not enough. The expression must correctly represent the business requirement.

---

# 🧪 Arithmetic Challenge

I also solved a balance calculation challenge.

Given:

    Total Fee = 50000
    First Payment = 20000
    Second Payment = 5000

The remaining fee is:

    remaining_fee = total_fee - first_payment - second_payment.

Therefore:

    50000 - 20000 - 5000 = 25000

The important lesson was that the data object's value changes after each calculation, while the data object itself remains the same.

---

# 🎤 Interview Preparation

Today I practiced interview questions related to:

- ABAP statements
- ABAP keywords
- Declaration
- Assignment
- Comments
- Syntax
- Case sensitivity
- Variables
- Operators
- Operands
- Expressions
- Arithmetic operations
- Parentheses
- Statements vs expressions
- Business logic
- Practical ABAP programming

I was able to explain these concepts using my own examples and business scenarios.

---

# 🧪 Quiz Assessment

### Module 1 — ABAP Statements & Syntax

Answers:

    1. C
    2. A
    3. FALSE
    4. B
    5. TRUE

**Score: 5/5 ✅**

---

### Module 2 — Variables & Expressions

Answers:

    1. B
    2. Variable marks replaces its value from 80 to 95.
    3. C
    4. TRUE
    5. C

**Score: 5/5 ✅**

---

### Module 3 — Operators & Expressions

Answers:

    1. C
    2. B
    3. C
    4. B
    5. TRUE

**Score: 5/5 ✅**

---

# 📊 Overall Quiz Performance

**15/15 — 100% ✅**

This shows strong conceptual understanding of today's topics.

---

# ⚠️ My Mistakes and Areas for Improvement

## 1. ABAP Syntax Accuracy

I am still learning to consistently remember:

- Periods after statements
- Correct declaration syntax
- Correct data types
- Correct expression syntax
- Correct placement of keywords

I need more hands-on practice to make these natural.

---

## 2. Arithmetic Logic

I initially wrote:

    total_fee - first_payment + second_payment

when I intended to subtract both payments.

I corrected it to:

    total_fee - first_payment - second_payment.

This taught me that business logic must be checked independently of syntax.

---

## 3. Data Type Selection

I experimented with:

    TYPE p

for percentage and payment-related calculations.

I need to become more comfortable choosing appropriate numeric types based on:

- Whole numbers
- Decimal values
- Precision
- Business requirements

---

## 4. Independent Coding

Today I successfully started writing ABAP programs, but I still require guidance when constructing a program from scratch.

My next goal is to gradually reduce dependency on examples and write complete small programs independently.

---

# 🏆 Today's Major Achievement

## I WROTE MY FIRST ABAP PROGRAMS 🎉

This is one of the most important milestones in my SAP learning journey.

Until now, most of my learning involved:

    SAP Concepts
    DDIC
    Data Types
    Data Objects
    Architecture
    Definitions
    Interview Questions

Today I crossed an important boundary:

    THEORY
       ↓
    CODE
       ↓
    EXECUTION
       ↓
    OUTPUT

I am now beginning to develop actual ABAP programming skills.

---

# 📈 Current Status After W2-D5

I can now:

- Explain ABAP statements
- Identify ABAP keywords
- Declare data objects
- Assign values
- Understand comments
- Understand basic ABAP syntax
- Understand variables
- Understand operators
- Understand operands
- Build expressions
- Perform arithmetic calculations
- Use `WRITE` for basic output
- Understand statements vs expressions
- Build simple business logic
- Write basic ABAP programs
- Debug basic logical mistakes
- Explain ABAP concepts in interview format

---

# 💼 Business Thinking Developed Today

I am beginning to understand that ABAP programming is not simply:

> "Write code that works."

Instead, it is:

> "Understand the business requirement → translate it into logic → implement the logic in ABAP → test the result."

For example:

### Business Requirement

> Calculate how much student fee remains after multiple payments.

### Business Logic

    Remaining Fee
    =
    Total Fee
    -
    First Payment
    -
    Second Payment

### ABAP

    remaining_fee = total_fee - first_payment - second_payment.

This is the beginning of thinking like an ABAP developer.

---

# 🧠 Personal Reflection

Today was one of the most exciting days in my SAP journey.

I finally started writing actual ABAP programs.

Seeing a program such as:

    DATA marks TYPE i.
    marks = 95.
    WRITE marks.

made the learning feel much more real than simply reading definitions.

The most important realization from today is:

> **Programming becomes meaningful when I can convert a real-world problem into executable logic.**

The student result and payment examples helped me understand this connection.

I also learned that making mistakes is part of programming.

My incorrect payment expression:

    total_fee - first_payment + second_payment

was not simply a syntax issue. It was a business-logic mistake.

Correcting it helped me understand that an ABAP developer must think about both:

    Technical Correctness
            +
    Business Correctness

Both are necessary for professional SAP development.

---

# 📊 Evidence of Progress

| Area                    | Evidence       |
|-------------------------|----------------|
| ABAP Statements         | ✅ Learned     |
| ABAP Keywords           | ✅ Learned     |
| Declaration             | ✅ Learned     |
| Assignment              | ✅ Learned     |
| Comments                | ✅ Learned     |
| Variables               | ✅ Learned     |
| Operators               | ✅ Learned     |
| Operands                | ✅ Learned     |
| Expressions             | ✅ Learned     |    
| Arithmetic Operations   | ✅ Learned     |
| Basic Output            | ✅ Learned     |
| Practical ABAP Programs | ✅ Completed   |
| Interview Questions     | ✅ Completed   |
| Quiz                    | ✅ 15/15       |
| Business Logic          | 🟢 Developing  |
| Independent Coding      | 🟡 Improving   |

---

# 🚀 Next Learning Direction

The next stage will continue moving from basic ABAP syntax toward program logic.

The learning progression will gradually become:

    ABAP Syntax
         ↓
    Data Objects
         ↓
    Variables & Constants
         ↓
    Expressions
         ↓
    Arithmetic Operations
         ↓
    Conditional Logic
         ↓
    Loops
         ↓
    Internal Tables
         ↓
    Data Processing
         ↓
    Database Interaction
         ↓
    Real Business Programs

The goal is to progressively move from small examples toward realistic SAP development scenarios.

---

# 🔥 Key Takeaway

> **"Don't just learn ABAP syntax. Understand the business requirement, build the logic, write the code, test the result, identify mistakes, correct them, and document what you learned."**

Today I took my first real step toward that approach.

---

# 🏁 W2-D5 Status

**✅ COMPLETED**

**Modules Completed:** 3/3  
**Topics:** ABAP Statements + Variables/Expressions + Operators  
**Quiz Score:** 15/15 — 100%  
**Interview Preparation:** ✅ Completed  
**Practical Programs:** ✅ Completed  
**First ABAP Programs:** 🎉 Completed  
**Business Logic:** 🟢 Developing  
**Programming Confidence:** 🟢 Increasing  
**Overall Status:** 🟢 Strong Progress
