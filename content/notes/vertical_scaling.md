+++

title = "Vertical Scaling"
template = "notes.html"
description = "Scaling applications"

+++

Vertical Scaling is an attempt to **increase the capacity of a single machine**. Here the resources such as processing power, storage, memory, and more are **added to an existing work unit**.

Vertical Scaling is done to increase the capacity of existing hardware or software by adding resources. It can **enhance your server without manipulating your code**. But it is limited by the fact that you can only get as big as the size of the server.

For example, let us consider that you have a business website. As your business grows, your website traffic will also increase. At times, with the increasing traffic, your server performance starts degrading. To manage the traffic load, your website needs to scale its resources by adding faster CPU Processors, RAM, disk capacity, etc. In such cases, you use a vertical scaling model that can enhance the capabilities of the same server and node.

Vertical Scaling boosts the power of the individual server to handle the increasing load. Adding more machines in vertical Scaling is often restricted to the capacity of a single machine. In vertical-scaling, **there is no partitioning of the data**. It all resides on a single node.

Vertical Scaling strategy is **widely used in applications of small and mid-sized companies**. One of the most common examples of Virtual Scaling is buying expensive hardware and using it as a Virtual Machine hyper-visor.

Vertical Scaling is also called the Scale-up approach.

Example of Vertical Scaling: MySQL and Amazon RDS.

Advantages of Vertical Scaling:
- Reduced software costs.
- Easy Implementation.
- Licensing fees is less.
- Consumes less power.
- Cooling costs are lesser than horizontal scaling.
- Cooling costs are lesser than horizontal scaling.
- Application compatibility is maintained..
- Disadvantages of Vertical Scaling:
- Limited Scaling.
- The risk for downtime is much higher than horizontal scaling.
- Greater risk of outages and hardware failures.
- Finite scope of upgradeability in the future.
- Severe vendor lock-in.
- The cost of implementing is expensive.

Copied from: [https://www.redswitches.com/blog/difference-between-horizontal-vertical-scaling](https://www.redswitches.com/blog/difference-between-horizontal-vertical-scaling)
