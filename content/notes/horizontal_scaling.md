+++

title = "Horizontal Scaling"
template = "notes.html"
description = "Scaling applications"

+++

Horizontal scaling is a strategy used to enhance the performance of the server node by **adding more instances of the server** to your existing pool of servers so that the load can be equally distributed.

In horizontal scaling, **we do not change the capacity of the individual server**, but **we decrease the load on the server**. Horizontal scalability is achieved with the help of a distributed file system, clustering, and load – balancing.

Some of the reasons why businesses choose to scale horizontally include an increase in their I/O concurrency, need to reduce the load on existing nodes and to expand disk capacity. Horizontal-scaling is considerably easy as you can add more machines to the existing pool. It follows the partitioning of the data in which each node contains only one part of the data.

For example, let us consider that you have a business website. When there is growth in your business grows, there will be growth in your website traffic. This will increase the responsibility of your server and nodes. So in order to reduce this load, we can add one more server of the same capacity along with the existing server. Now with two servers, the traffic can be managed effectively.

The Internet has boosted the use of Horizontal Scaling. Many giant web service providers such as Google with its Gmail and YouTube, Yahoo, Facebook, eBay, Amazon, etc. are heavily utilizing horizontal scaling.

Horizontal scaling is also known as scaling out.

Example of horizontal scaling: Cassandra and MongoDB.

Advantages of Horizontal Scaling:
- Easily scalable tools
- Supporting linear amplifies the capacity
- Easier to run fault-tolerance
- Easy to upgrade
- Better use of smaller systems
- Cost of implementing is less expensive compared to scaling-up
- Improved resilience due to the presence of discrete, multiple systems
- Infinite Scale can use an endless number of instances to enable limitless growth
- Disadvantages of Horizontal Scaling:
- Architectural design is highly complicated
- High licensing fees
- High utility costs such (cooling and electricity)
- Bigger footprint and impact on the data center
- Extra networking equipment such as routers and switches are required


Copied from: [https://www.redswitches.com/blog/difference-between-horizontal-vertical-scaling](https://www.redswitches.com/blog/difference-between-horizontal-vertical-scaling)