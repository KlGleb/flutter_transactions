# Transaction Manager App

## Introduction

This Flutter application is a test project aimed at creating a transaction management system. The
app features a login screen, a main page with a list of transactions, and a donut chart representing
transaction types. The data sources emulate Rest API requests, error handling is implemented on the
login screen, and there's an in-memory SQLite cache layer that reacts responsively using Drift. Some
components are unit-tested (dao, repositories, reducers, middlewares).

## Getting Started

Before running the application, perform code generation using the following command:

```bash
sh codegen.sh
```

Alternatively, you can use the following commands:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

Login credentials: username/password (default values).

## Features

* Data Sources: The app utilizes Data Sources emulating Rest API requests.
* Error Handling: Error handling is implemented on the login screen.
* SQLite Cache: There's a reactive in-memory SQLite cache layer using Drift.
* Unit Testing: Partial unit test coverage includes dao, repositories, reducers, middlewares.

## Task Description

The task is to create a Flutter application with the following features:

1. Authentication:

* Login with username/password.
* Upon successful login, the main page is displayed.

2. Main Page:

* Two tabs: a list of transactions and a donut chart dividing transactions by operation type.

3. Transaction List:

* Display each transaction with:
    * Transaction type (transfer, deposit, withdrawal).
    * Transaction number.
    * Transaction amount.
    * Total transaction count is visible in the list.

4. Transaction Details:

* View transaction details upon selecting a transaction.
* Displayed details include:
    * Transaction date.
    * Amount.
    * Commission.
    * Total.
    * Transaction number.
    * Operation type (deposit, transfer, withdrawal).
* Option to cancel a transaction; canceled transactions disappear from the list.

5. Navigation:

* Navigate back to the transaction list.

6. Storage:

* Data storage can be chosen based on preference (XML, SQLite, Firebase, etc.).
* Optionally, the application can be implemented without data storage.

7. State Management:

* Use Redux for state management (optional).

Feel free to choose the data storage method according to your preference, and remember that
utilizing Redux for state management is a plus.

Happy coding!