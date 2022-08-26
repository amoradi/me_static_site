+++

title = "Principled GraphQL"
template = "notes.html"
description = "Integrity, Agility & Operations Principles"

+++

## Integrity

### One Graph
Ensuring that the graph is well-defined, stable, and consistent
- Your company should have **one unified graph**, instead of multiple graphs created by each team.

### Federated Implementation
Though there is only one graph, the implementation of that graph should be **federated across multiple teams**.
- ...maintains the **value of a single, unified view of the graph**, while keeping **development efforts** across the company **decoupled**.

### Track the Schema in a Registry
There should be a **single source of truth** for registering and tracking the graph.

> Just like it's important to track source code in a version control system, it's important to track the definition of your graph in a **schema registry.** There should be a single schema registry for your company that is **the authoritative definition of the graph**, rather than relying on whatever processes are running at the moment or whatever code is checked in on a developer's laptop. Like a source control system, the schema registry should store the **history of changes to the graph** and who made them, and it should understand the concept of **multiple versions of the graph**s (for example, staging and production, or different development branches) in a way that parallels the software development process.

> The schema registry should become the **central hub of the system**, **powering developer tools**, **workflows**, or any business processes that would benefit from awareness of the graph and **any actual or proposed changes to it**.

## Agility
Rapidly rolling out the graph and continuously adapting it to changing needs

6. Iteratively Improve Performance
7. Use Graph Metadata to Empower Developers

### Abstract, Demand-Oriented Schema
> The schema should act as an abstraction layer that provides **flexibility to consumers** while **hiding service implementation details**.

### Use an Agile Approach to Schema Development
- The schema should be **built incrementally** based on actual requirements and **evolve smoothly** over time.

> It may be tempting to try to define, ahead of time, the “perfect schema” for all of your organization's data. Rather, what really makes a schema valuable is the degree to which it follows actual user requirements, which are never known perfectly up front and are constantly changing. The true path to the “perfect schema” is to make it easy for the graph to evolve **in response to actual needs.**

> **Fields shouldn't be added to the schema speculatively.** Ideally, **each field should be added only in response to a concrete need** by a consumer for additional functionality

> Updating the graph should be a continuous process. Rather than releasing a new “version” of the graph periodically, such as every 6 or 12 months, it should be possible to change the graph many times a day if necessary. New fields can be added at any time. **To remove a field, it is first deprecated, and then removed when no consumers use it.** The **schema registry enables this agile evolution of the graph**, together with **processes** and **tooling** that keep everyone aware of changes that could affect them. This ensures that only fully vetted changes can go into production.

### Iteratively Improve Performance
- Performance management should be a **continuous, data-driven process**, adapting smoothly to changing query loads and service implementations.

> Rather than optimizing every possible use of the graph, the **focus should be on supporting the actual query shapes** that are needed in production. **Tooling should extract proposed new query shapes and surface them**, **before they go into production**, to all affected service teams **with latency requirements** and projected query volume. Once the query is in production, its performance should be continuously monitored. If this principle is followed, problems should be easy to track back to the service that is not behaving as expected.

### Use Graph Metadata to Empower Developers
- Developers should be equipped with rich awareness of the graph throughout the entire development process.

## Operations
Securely deploying the graph to production at scale

- Grant access to the graph on a per-client basis, and manage what and how clients can access it.

Authorization in a graph has two equally important aspects:
- access control, which dictates which objects and fields a user is allowed to access
- **demand control**, which **dictates how (and how much) the user is allowed to access those resources**. 

It is a mistake to allow users to perform any possible query regardless of cost, with no ability to manage its impact on production systems.

Best practices for demand control include:

- When untrusted users are accessing production systems, they should only send queries that have been preregistered by the authenticated developer of the app, instead of allowing them to send arbitrary queries with the app's credentials. This is sometimes relaxed for internal apps that are distributed only to trusted users.

- For apps that are expected to send large numbers of queries, teams should design a query approval workflow, aligned with the broader software development cycle, to vet queries before they go into production. This ensures that they do not fetch unnecessary data and that server capacity is available to support them.

- As a second line of defense, estimating the cost of a query before performing it and instituting per-user and per-app query cost budgets can protect against overuse of preregistered operations or in cases where operation preregistration is not possible.

- Developers should be able to disable the ability of particular apps to send particular queries in production, either as a safety net in emergencies or if a third party app is found to be using the graph in unacceptable ways.


## Structured Logging
Capture structured logs of all graph operations and leverage them as the primary tool for understanding graph usage.

> A wealth of information can be captured about each operation (read or write) that is performed on a graph: what user and app performed the operation, what fields were accessed, how the operation was actually executed, how it performed, and more. This information is highly valuable and should be systematically captured and made available for later use. **Instead of a text log, it should be captured in a structured, machine readable format so that it can be leveraged for as many purposes as possible.**

The record of a graph operation is called a trace. A trace should bring together all pertinent information about an operation in one place, including business information (who performed the operation, what was accessed or changed, which feature of which app built by which developer, whether it succeeded, how it performed) and purely technical information (which backend services were contacted, how each service contributed to latency, whether caches were used).

Because traces truly capture how a graph is being used, they can be used for a wide range of purposes:

- Understanding whether a deprecated field can be removed, or if not, the specific clients that are still accessing it and how important they are
- Predicting how long a query will take to execute – in realtime, as the developer is typing the query in their IDE – based on live production data
- Automatically detecting problems in production (such as increased latency or error rates) and diagnosing their root cause
- Providing an authoritative audit trail showing which users have accessed a particular record
- Powering business intelligence queries (do people search for ice cream more often when it is hot where they are?)
- Generating invoices for partners based on API usage, with the possibility of a detailed cost model based on either the particular fields accessed or the resources consumed

Traces for all graph operations should be collected in one central place, so that there is one authoritative stream of traces. This stream can then be piped into other observability systems (perhaps after a simple transformation for existing systems that are not GraphQL-aware), or stored in one or more data warehouses for later use (aggregated and sampled as budget, use cases, and scale require).

### Separate the GraphQL Layer from the Service Layer
Adopt a layered architecture with graph functionality broken into a separate tier rather than baked into every service.

Footnotes: [https://principledgraphql.com](https://principledgraphql.com)
