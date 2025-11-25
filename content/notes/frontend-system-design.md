+++

title = "Frontend System Design: Rendering & Delivery Models"
template = "notes.html"
description = ""
draft = false

+++


## Static Site Generation (SSG)
- Pages are built during deployment. Visitors get pre-rendered HTML instantly.
- Easy to handle millions of users.

Use case: Documentation sites, marketing landing pages, or personal blogs where content updates happen through deployments, not user actions.

## Incremental Static Regeneration (ISR)
- Pages are still pre-built, but they can update automatically without a full redeploy.
- After revalidation time, trigger a background rebuild of that specific page on the server, not a full deployment. Per page, not site-wide.
- Just as fast as SSG, but the content stays fresh.
- Works with CDNs, so updates happen without downtime.

Use case: E-commerce product pages where most content (e.g., descriptions or images) is static, but some parts, like prices or stock info, update occasionally.

ISR keeps the page fresh without full redeploys, while real-time data, such as live prices, can come from APIs.

## Server-Side Rendering (SSR)
- The server builds the page for each request. It fetches the data, generates the HTML, and sends it to the user.
- Keeps content fresh and easy to personalise. Perfect for pages that need real-time data or personalised content.

Use case: Social media feeds, admin dashboards, or user-specific pages where content varies by session.

## Client-Side Rendering (CSR)
- The browser does most of the work instead of the server.
- Works best for apps people use for a long time, like dashboards or editors.
- Reduces pressure on the server.

Use case: Complex apps like Figma, Notion, or Google Docs, where the app is highly interactive and users stay on the page for extended sessions.


## Hybrid Rendering
- Different parts of your app might have different needs. For example, some pages stay mostly the same, while others need fresh or personalised data. 

Use case:
- Large-scale apps like e-commerce platforms often combine different rendering strategies:
- The homepage and category pages use static generation for speed.
- Product pages use incremental static regeneration to keep content fresh.
- User account pages use server-side rendering for personalised data.
- The shopping cart uses client-side rendering for real-time updates without page reloads.

## Content Delivery Networks (CDNs) & Edge Delivery
- No matter which rendering method you choose, serving content efficiently is super important. CDNs keep copies of your static files on servers worldwide. This lets users download them from a nearby location instead of your main server.
- Edge rendering takes this idea a step further. Instead of just serving static files, it can actually run code or build pages at the edge.
- Faster load times everywhere. Easy to scale to millions of users. Works perfectly with SSG, ISR, SSR, or hybrid setups.

Use case: Any globally distributed application. Media sites like The New York Times use CDNs to serve articles instantly worldwide.


Footnotes: [https://newsletter.systemdesign.one/p/frontend-system-design](https://newsletter.systemdesign.one/p/frontend-system-design)