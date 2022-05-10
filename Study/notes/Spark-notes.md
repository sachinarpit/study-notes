- [What is Big Data and how it started](#what-is-big-data-and-how-it-started)
- [Big Data Platform Requirements](#big-data-platform-requirements)
- [HADOOP architecture, history and its evolution](#hadoop-architecture-history-and-its-evolution)
- [Enterprise Data Management Requirements](#enterprise-data-management-requirements)
- [Need of distributed data storage and processing](#need-of-distributed-data-storage-and-processing)
- [Datalake concept](#datalake-concept)
- [Data Warehouse vs Data Lake](#data-warehouse-vs-data-lake)
- [Matured Data Lake concept solving original Data Requirements (Collection / Ingestion, Storage, Processing, Retrieval)](#matured-data-lake-concept-solving-original-data-requirements-collection--ingestion-storage-processing-retrieval)
- [How Data Lake fulfills data managemnet requirements](#how-data-lake-fulfills-data-managemnet-requirements)
- [HADOOP Ecosystem](#hadoop-ecosystem)
- [What is Spark](#what-is-spark)
- [Spark core](#spark-core)
- [Why Spark](#why-spark)
- [Spark Development environments](#spark-development-environments)
- [Installation](#installation)
- [Run Hello World program](#run-hello-world-program)
- [Spark execution modes](#spark-execution-modes)
- [Driver, Executors and Driver memory, Driver cores in the light of execution modes](#driver-executors-and-driver-memory-driver-cores-in-the-light-of-execution-modes)
- [What happens, when you submit your job to Spark cluster](#what-happens-when-you-submit-your-job-to-spark-cluster)
- [How Spark works on local machine](#how-spark-works-on-local-machine)
- [How Spark program runs](#how-spark-program-runs)
- [Run Hello World program](#run-hello-world-program-1)

# What is Big Data and how it started
The COBOL, also known as Common Business-Oriented Language, was the first of its kind.COBOL allowed us to store data in files, create index files, and process data efficiently. However, we saw data processing shift from COBOL to relational databases such as Oracle and Microsoft SQL Server.

You can think of COBOL as the first serious attempt towards enabling data processing.And COBOL was designed in 1959.The Oracle database achieved the subsequent major success in enabling data processing.And Oracle was founded in 1977.So data processing has always been at the centre of the Software industry. Everything else will come and go, but data will only grow.

We have used RDBMS technology for many decades.Some popular RDBMS systems are Oracle, SQL Server, PostgreSQL, MySQL, Teradata, and Exadata.

These RDBMS systems offered us three main features to help us develop Data Processing applications.
1.  SQL -An easy Data Query Language
2.  Scripting Languages such as PL/SQL and Transact SQL
3.  Interface for other programming languages such as JDBC and ODBCSo we used SQL for querying data and PL/SQL for doing things that we couldn't do using SQL.

They also offered interfaces such as ODBC/JDBC so we could interact with data using the programming languages. We could create data processing applications using these technologies.

# Big Data Platform Requirements
1.  Store high volumes of data rriving at a higher velocity
2.  Accomodate structured, semi-structured and unstructured  data variety 
3.  Process high volumes of a variety of a data at higher velocity

---

There were two approaches to solve the big data problem:
1.  The monolithic approach designs one large and robust system that handles all the requirements. Teradata and Exadata are examples. These two systems mainly support only structured data. So we cannot call them big data systems, but they are designed using a monolithic approach.
2.  The distributed approach takes many smaller systems and bring them together to solve a bigger problem.

| Criteria                | Monolithic Approach         | Monolithic Approach     |
| :---                    |:----                        | :---                    |
| Scalability             | Vertical                    | Horizontal              |
| Fault Tolerencend HA    | Primary/Secondary           | Multifold               |
| Cost effectiveness      | Expensive                   | Economical              |


Hadoop came up as a new data processing platform to solve Big Data problems.

The Hadoop platform was designed and developed in layers.The core platform layer offered three capabilities:
1. Distributed cluster formation or Cluster Operating System (YARN)
2. Data storage and retrieval on the distributed cluster or Distributed Storage (HDFS)
3. Distributed data processing using Java programming language or Map-Reduce Framework (MapReduce)

Here is a comparison between Database and Hadoop.

<img width="876" alt="image" src="https://user-images.githubusercontent.com/8909535/167280286-2b33bc0c-0627-4361-85af-92e65e5bcb0d.png">

# HADOOP architecture, history and its evolution
Hadoop is a distributed data processing platform that offers three core capabilities listed below:
1.  YARN - Cluster Resource Manager
    YARN is the Hadoop cluster resource manager. It allows multiple applications to run on the Hadoop Cluster and share resources amongst the applications. 
    YARN has 3 components - 
    * RM - Resource Manager
    * NM - Node Manager
    * AM - Application Master

    Assume we installed Hadoop, and now these five computers form a Hadoop cluster. Hadoop uses a master-slave architecture.So one of these machines will become the master, and the remaining will act as the worker node. 

<img width="820" alt="image" src="https://user-images.githubusercontent.com/8909535/167281392-0ffe0bc7-703e-41f2-bb7a-deb7fd6935e4.png">

<p>We have a five-node cluster - One node acts as a master and runs the YARN resource manager service. The other four nodes act as a Worker and run a node manager service.

The node manager will regularly send the node status report to the resource manager. 

For running an application on Hadoop, you must submit the application to the YARN resource manager. Assume you submitted a Java application to the YARN using a command line submit tool. 
  
Now the resource manager should run this application on the cluster.So, the resource manager will request one of the node managers to start a resource container and run an AM (application master) in the container.  And your application starts running inside the Application Master container.So, we submit our application to the Resource Manager.
  
The resource manager requests the node manager for allocating an application master container and starting your application inside the AM container. Each application on YARN runs inside a different AM container.If you have ten applications running in parallel, you will see 10 AM containers on your Hadoop cluster.
</p>

3.  HDFS - Distributed Storage
<p>
The HDFS stands for Hadoop Distributed File system, and it allows you to save and retrieve data files in the Hadoop Cluster.The HDFS has the following components.
</p>

  * Name Node (NN)
  * Data Node (DN)

  <img width="824" alt="image" src="https://user-images.githubusercontent.com/8909535/167281534-ea583b56-d1df-49d4-be1f-0328d632be61.png">

<p>
Assume we have five computers shown below. We already installed Hadoop on these computers and created a Hadoop cluster. 
  
Hadoop will install the Name Node service on the master.And each worker node runs a data node service. 

The name node with the data node service forms the HDFS. The primary purpose of the HDFS is to allow us to save files on this Hadoop cluster and read them whenever required.

</p>
  


4.  Map/Reduce - Distributed Computing
<p>
Map-reduce is a programming model and a framework. A programming model is a technique or a way of solving problems. The M/R framework is a set of APIs and services that allow you to apply the map-reduce programming model.
  
Hadoop taught us the map-reduce programming modal and also offered a Map-Reduce programming framework to implement it.
  
Problem in hand:
  
You have to count the lines in a 20 TB CSV file. 
  
There are two challenges in this problem statement:
1.Huge file size, It is hard to find machines to store 20 TB of data. And this problem becomes more complex if we grow the size in petabytes.
2.We also have a processing time problem. A simple line count on a 20 TB file takes hours or days.

  <img width="803" alt="image" src="https://user-images.githubusercontent.com/8909535/167281621-5ccdc496-5ad8-4276-b606-dcd45808c462.png">

  How to use M/R to solve this problem
  
  Hadoop offered to solution to both problems we discussed in the previous slide. You can use the Hadoop cluster to store the file. Let's assume you have a 21 node Hadoop cluster. One node becomes the master, and the other 20 nodes are the workers. HDFS runs a name node in the master and a data node on the other workers. YARN runs a Resource Manager on the master, and Node Manager runs on the workers. So we have those services running on the cluster.

  You can use HDFS to copy your 20 TB file on this cluster. HDFS will break the file into small 128 MB blocks and spread them across the cluster. So some data nodes will sore data blocks, and altogether they can easily store your 20 TB file. Your storage problem is taken care of by the Hadoop cluster. If you need more storage, you can increase the cluster size and add more computers.

  Now let us come to the processing time problem. I have broken my logic into two part which you can see in the image below. The first part is known as the Map function. The second part is known as the Reduce function. The old logic was to open the file and count the lines. And the new logic is almost the same as old logic. But the map function opens the file block and counts the lines. And the old logic opens the file and counts the lines.

  I can run the map function on all the data nodes in parallel. This map() function will open each block on the data node and count the lines. End of the execution, I will have the number of lines in the blocks at the given data node. I am counting lines on 14 data nodes in parallel. Everything runs at the same time. And I will get the line counts in 1/14th of the time compared to doing it on a single machine. However, I will have 14 line counts. Each count represents the number of lines on their respective data node.

  Then, I will start a Reduce function at one node. All the data node will send their counts to the reduce function. The reduce function will receive 14 line counts in an array. So I will look through the array and sum up all the line counts. The reduce function will loop through the list of counts and sum it up. And the sum is the number of lines in the file.

  <img width="837" alt="image" src="https://user-images.githubusercontent.com/8909535/167281669-7e33b8f1-ab85-452b-a130-adc825845427.png">

  Here is the summarized context of Map Reduce.

  <img width="448" alt="image" src="https://user-images.githubusercontent.com/8909535/167281675-b3709b16-cfb0-4a50-bce9-1a7c07c6dffc.png">

</p>

# Enterprise Data Management Requirements
* Collection / Ingestion
* Storage
* Processing
* Retrieval

# Need of distributed data storage and processing
<p>
Vertical scalability was fine until data volumes and processing/computation power/needs grown to a unmanagable level with vertical scalaibility.

Before Distributed processing, Data warehouses (Teradata, Exadata etc.) were very successful using vertical scalability (high capital cost).

Google was the company to realize this, do research and create abusiness around it. Google started trying to solve above "Data Requirements" at larger scale.

Google released 2 whitepapers to solve Data Storage and Processing needs via GFS (2003) and MapReduce (2004) respectively. These whitepapers led to the invention of HDFS and Hadoop MapReduce.

The open-source community well appreciated these whitepapers, and they formed the basis for the design and the development of a similar open-source implementation –The Hadoop. The open-source community implemented the GFS as a Hadoop Distributed File System –HDFS. They applied Google MR as the Hadoop MapReduce programming framework.Hadoop grabbed immense attention and popularity among organizations and professionals.Since the development of Hadoop, there have been many other solutions developed over the Hadoop platform and open-sourced by various organizations.Some of the most widely adopted systems were Pig, Hive, and HBase.

<img width="661" alt="image" src="https://user-images.githubusercontent.com/8909535/167281981-4d46157c-a9e0-4717-beb5-652f56191dae.png">


Apache Hive was one of the most popular components of Hadoop. Hive offered the following core capabilities on the Hadoop Platform:
    1. Create Databases, Tables, and Views
    2. Run SQL Queries on the Hive Tables
    
So Hive simplified using Hadoop. Application developers struggled to solve data processing problems using Map Reduce. 
    
Hive came to the rescue. It allowed us to create databases and tables using DDL Statement.Then they also allowed us to use SQL queries on the table.The majority of the development workforce was familiar with the RDBMS, and they already knew SQL.So using SQL was easy to adopt.
    
Hive SQL engine internally translated SQL queries into M/R programs.But application developers were saved from writing Map Reduce code in Java.

Hadoop as a platform and Hive as a Hadoop database became very popular.But we still had the following problems which needed improvements:
    1. Performance
    2. Ease of development
    3. Language support
    4. Storage 
    5. Resource Management

Spark advantages over HADOOP
<img width="847" alt="image" src="https://user-images.githubusercontent.com/8909535/167282075-aaca54f8-7fa1-4d28-8912-dbe2c22911f4.png">

</p>

# HADOOP vs Data warehouse

# Datalake concept
Challenges with vertical scalability & high capital cost inspired James Dixon, the CTO of Pentaho to come up with a new concept called 'Data Lake' in Oct 2010.

Inititally Data Lake was synonymous with Hadoop but overtime, lot of things evolved like cloud infrastructure in Data Lake.
<img width="1189" alt="image" src="https://user-images.githubusercontent.com/8909535/167073653-5344c3a2-8408-4076-bace-1c007d12548a.png"> 


# Data Warehouse vs Data Lake
![image](https://user-images.githubusercontent.com/8909535/167074141-2ac1aa26-e1f3-4bcc-b119-9de1353ea361.png)

# Matured Data Lake concept solving original Data Requirements (Collection / Ingestion, Storage, Processing, Retrieval)
<img width="1207" alt="image" src="https://user-images.githubusercontent.com/8909535/167073909-5c46aac3-0a05-422f-b494-605a175fc584.png">

# How Data Lake fulfills data managemnet requirements
* Collection / Ingestion
  - Ingestion in Data LAke is all about identifying, implementing and managing right tools to bring data from the source system to the Data Lake. There is no single tool, which solve the purpose in all the usecases and hence, many vendors are competing in this place. 
 
* Storage
  - The core of the data Lake platform is storage infrastructure. In today's Data Lake, this could be an on-premise HDFS or cloud storage i.e. AWS  S3, Azure Blob, Google Cloud storage etc. Cloud storage is leading because, they offer scalability and high availability access at extremely low cost almost no time to procure.

* Processing - This is the place where all computation is going to happen, which involves initial data quality check, trasforming and preparing the data, correlating, aggregating, analyzing and extracting some business insights, applying ML models. But, we want to do all these on large scale, so this layer is broken further into two parts to manage things and separate out the responsibilities.
  - Data processing framework - Core framework to sign and develop distributed computing applications. Apache Spark falls in this place and many similiar things. We have 3 comptetitors - YARN, Mesos and Apache Kubernetes 
  - Orchestration system - Responsible for the formation of the cluster, managing the resources and scaling up/down.
* Retrieval - Most critical capability of a data lake is to allow you to consume data from data lake. Think of a data lake as a repository of a raw and processed data. Consumption is all about tting  data for real life usage. Consumption requirements come in all required formats. Consumers could be Data lysts and data scientists oking to access data from the lake, apps, dashboards interested in gregated lts and insights. Some of them would ask you to allow to access lake data via JDBC/ODBC connections or REST interface. Experimenting  scientists might be interested in ssing files. To serve all different consumption requirements, there are many competitors too in this space.

Other capabilities are needed complete the data lake implementation. The most critical ones are - 
* Security and Access Control 
* Scheduling & Workflow
* Data catalogue & Metadata management
* Data lifecycle and governance
* Operations and Monitoring

# HADOOP Ecosystem
<img width="1601" alt="image" src="https://user-images.githubusercontent.com/8909535/167064327-8ed4ce01-7167-4c0e-bafe-f0d127e1c080.png">


# What is Spark
Apache Spark started at UC Berkeley in 2009, and open sourced in 2010 under a BSD license. In 2013, the project was donated to the Apache Software Foundation and switched its license to Apache 2.0. In February 2014, Spark became a Top-Level Apache Project.

Apache Spark™ is a multi-language engine for executing data engineering, data science, and machine learning on single-node machines or clusters.

<img width="940" alt="image" src="https://user-images.githubusercontent.com/8909535/167127156-0cecc9c8-905a-4087-9cba-5d81b439f285.png">

* General Execution: Spark Core - Spark Core is the underlying general execution engine for the Spark platform that all other functionality is built on top of. It provides in-memory computing capabilities to deliver speed, a generalized execution model to support a wide variety of applications, and Java, Scala, and Python APIs for ease of development.

* Structured Data: Spark SQL - Many data scientists, analysts, and general business intelligence users rely on interactive SQL queries for exploring data. Spark SQL is a Spark module for structured data processing. It provides a programming abstraction called DataFrames and can also act as distributed SQL query engine. It enables unmodified Hadoop Hive queries to run up to 100x faster on existing deployments and data. It also provides powerful integration with the rest of the Spark ecosystem (e.g., integrating SQL query processing with machine learning).

* Streaming Analytics: Spark Streaming - Many applications need the ability to process and analyze not only batch data, but also streams of new data in real-time. Running on top of Spark, Spark Streaming enables powerful interactive and analytical applications across both streaming and historical data, while inheriting Spark’s ease of use and fault tolerance characteristics. It readily integrates with a wide variety of popular data sources, including HDFS, Flume, Kafka, and Twitter.
 
* Machine Learning: MLlib - Machine learning has quickly emerged as a critical piece in mining Big Data for actionable insights. Built on top of Spark, MLlib is a scalable machine learning library that delivers both high-quality algorithms (e.g., multiple iterations to increase accuracy) and blazing speed (up to 100x faster than MapReduce). The library is usable in Java, Scala, and Python as part of Spark applications, so that you can include it in complete workflows. 

* Graph Computation: GraphX - GraphX is a graph computation engine built on top of Spark that enables users to interactively build, transform and reason about graph structured data at scale. It comes complete with a library of common algorithms.

# Spark core
* Spark Compute Engine
Apache Spark doesn't offer - Cluster management and Storage management. All you can do with Spark is to run your a processing workload and this is managed by Spark compute engine. Spark compute engine is responsible for bunch of things -
  -  Breaking your data processing work into  smaller task
  -  Scheduling those tasks on the cluster parallel execution
  -  Providing data to these tasks
  -  Managing and monitoring those tasks
  -  Providing fault tolerence when job fails
 
And to do all these, e engine is also responsible  interacting with the cluster manager and data storage manager. So the Spark compute engine is the core that runs and manages your data processingrk and provides u a seemless experience. All you need to do is submit your data processing jobs to Spark and Spark Core is going to take of everything else. 

* APIs
Layer that offers core APIs in 4 programming languages. These are the APIs, that we used to write data processing logic during the initial days of the Apache Spark. These APIs were based on RDDs (Resilient Distributed Datasets) and people found them a little tricky to learn use them for their day to day data processing work. Some people still use them today, however these APIs are the hardest y to work with Apache Spark. They also lack some performance optimization features and Spark creators are recommending them to avoid as much as possible, however these APIs can offer you the highest level of flxibility solve some complex data processing problems.

* Spark SQL and Dataframes/Dataset , Streamingm, Mlib, GraphX
This layer is the prime area of interest for most of the Spark developers and data scientists. This layer is again a set of libraries, packages, APIs and DSL. These are developed by the Spark community ver and above the e APIs, so we will be using these top-level Is and DSLs but internally all of these  will be using Spark Core APIS and ultimately ngs will go to Spark Compute engine.

Spark exists on two kinds of platforms:
1. On Hadoop Platform - Data Lake
2. On Cloud Platform - LakehouseWe use the Hadoop platform as the Data Lake platform, and the primary developer technology on Hadoop Data Lake is now Apache Spark.Map/Reduce Framework is gone away forever, and Hive is also losing its place for Spark SQL.


# Why Spark
These 3 things make Spark a super popular distributed computing platform for data procesing.
* Abstraction
Spark will abstract away the fact that you are coding to execute ur program on a cluster of computers. In the best-case scenario, you will be working with tables and g SQL queries. You will feel like working with database. In the worst-case scenario, you will be working with RDDs and Dataframes. All the complexities of distributed storage, computation and parallel programming is abstracted away by the Spark core.
* Unified Platform
Spark combines the capabilities of the SQL queries, Batch processing, Stream processing, Structured and Semi-Structured handling, Graph processing, ML and deep learning. All of this in single framework using your favorite programming language. 
* Ease of use
If you compare with Hadoop and MapReduce code, Spark code is much rter, simple, easy to read understand. You also have a growing and evolving ecosystem to offer ready to use libraries, algorithms and integrations with a wide variety of other systems.

# Spark Development environments
Local - command line RPEL
  - Data storage ?
PyCharm
  - Data storage ?
Databricks notebooks
  * Sign up with Databricks community edition (email, debit/credit card and with AWS/Azure/GCP account)
  
Anaconda / Other notebooks
  - Data storage  - local filesystem - yes, HDFS, S3?
  - How to run Spark notebook - findspark not found???
  
  * Install Anakonda individual edition
  * Set SPARK_HOME
  * Install findspark
  * Initialize findspark (connection between Anaconda Python env and Spark installation

Cloud Offerings like AWS EMR, GCP Dataproc, Azure HDInsight


# Installation

# Run Hello World program
* How to create Spark program
* How to run Spark program 
  - Interactive clients - for learning/development phase, best for exploration purposes - ex. - spark-shell, notebooks 
  - Submit job - production usecases - package your jon abd submit it to Spark cluster for execution - spark-submit
    Apache Spark comes with spark-submit utility to allow you to submit your job to spark cluster

# Spark execution modes
  - Local
  - Client
  - Cluster

    Notebooks can run in Client (if running from local machine) and cluster (if running from cloud i.e. databricks or AWS, Azure, GCP etc. ???
  * When to use what


# Driver, Executors and Driver memory, Driver cores in the light of execution modes

# What happens, when you submit your job to Spark cluster

# How Spark works on local machine

# How Spark program runs

# Run Hello World program

# Spark sample queries
## find the top five destination countries in the data
val flightData2015 = spark.read.option("header","true").option("inferSchema","true").csv("flight-data/csv/2015-summary.csv")

spark-sql way

flightData2015.createOrReplaceTempView("flightData2015")
spark.sql("""select dest_country_name, sum(count) from flightData2015 group by dest_country_name order by sum( count) desc limit 5""").show()

spark dataframe way

import org.apache.spark.sql.functions.desc
flightData2015.groupBy("DEST_COUNTRY_NAME").sum("count").withColumnRenamed("sum(count)", "destination_total").sort( desc("destination_total")).limit(5).show()

#questions
* Executor/Slave (of a runing program) vs Worker of a multi-node cluster?
* spark-submit --help (is it for local or client mode ?)
* spark-shell --help (is it for cluster mode ?)
* spark session - Driver object
* spark context - can get context from session. context will have conf object
* cluster manager - can bedefined as master via spark-shell, spark-submit or a method od spark session (Driver)

in code, where do we specify master (cluster manager) - how to differentiate local env vs higher envs
 => via spark-submit command line options

* Spark session config precedence

* real project
  - log management
  - conf management
---
Datalake - other additonal capabilities - Security, Workflow, Metadata, Data lifecycle, Monitoring, Operations
---
How Spark SQL can help in processing semi-structured data
---
New concepts like Dataframes and Datasets are part of Spark Core APIs only..? in notes, it was mentioned they are RDD based.
---
What are job stages while running a cell in notebook?
---
Why its not getting sorted in "01-getting-started notebook - databricks community edition"?avg_price_df = diamonds_df.select("color", "price").groupBy("color").agg(avg("price")).sort("avg(price)")
avg_price_df.show()
---
difference in running pyspark, spark-shell and spark-submit from cmd line
---
csv file and tab limited files are structured?  why? Spark - The definitive guide says on Page#22 that CSV is semi-structured
---
app log is  unstructured..why?
---
Is it true that Spark programs written in scala perform better than written in Python, as Spark is written in Scala?
---
myRange = spark.range(100000000).toDF("number")
myRange.show(100000000)
Caused by: java.lang.OutOfMemoryError: Java heap space
---
show(), take() methods on DataFrame
---
how to read explain plan of sql, dataframe?
---
which should be preferred - spark-sql of datafram way? Both the below approaches have same plan

val flightData2015 = spark.read.option("header","true").option("inferSchema","true").csv("flight-data/csv/2015-summary.csv")
flightData2015.createOrReplaceTempView("flightData2015")
-------------------------------------------------
val sqlWay = spark.sql("""SELECT DEST_COUNTRY_NAME, count(1) FROM flightData2015 GROUP BY DEST_COUNTRY_NAME """)

== Physical Plan ==
AdaptiveSparkPlan isFinalPlan=false
+- HashAggregate(keys=[DEST_COUNTRY_NAME#16], functions=[count(1)])
   +- Exchange hashpartitioning(DEST_COUNTRY_NAME#16, 200), ENSURE_REQUIREMENTS, [id=#349]
      +- HashAggregate(keys=[DEST_COUNTRY_NAME#16], functions=[partial_count(1)])
         +- FileScan csv [DEST_COUNTRY_NAME#16] Batched: false, DataFilters: [], Format: CSV, Location: InMemoryFileIndex(1 paths)[file:/Users/arpitjain/Downloads/Spark-The-Definitive-Guide-master/data..., PartitionFilters: [], PushedFilters: [], ReadSchema: struct<DEST_COUNTRY_NAME:string>

val dataFrameWay = flightData2015.groupBy("DEST_COUNTRY_NAME").count()
== Physical Plan ==
AdaptiveSparkPlan isFinalPlan=false
+- HashAggregate(keys=[DEST_COUNTRY_NAME#199], functions=[count(1)])
   +- Exchange hashpartitioning(DEST_COUNTRY_NAME#199, 200), ENSURE_REQUIREMENTS, [id=#606]
      +- HashAggregate(keys=[DEST_COUNTRY_NAME#199], functions=[partial_count(1)])
         +- FileScan csv [DEST_COUNTRY_NAME#199] Batched: false, DataFilters: [], Format: CSV, Location: InMemoryFileIndex(1 paths)[file:/Users/arpitjain/Downloads/Spark-The-Definitive-Guide-master/data..., PartitionFilters: [], PushedFilters: [], ReadSchema: struct<DEST_COUNTRY_NAME:string>

---
How to understand explain plan of a dataframe

find the top five destination countries in the data
val flightData2015 = spark.read.option("header","true").option("inferSchema","true").csv("flight-data/csv/2015-summary.csv")

spark dataframe way

import org.apache.spark.sql.functions.desc
val dfWay = flightData2015.groupBy("DEST_COUNTRY_NAME").sum("count").withColumnRenamed("sum(count)", "destination_total").sort( desc("destination_total")).limit(5)

dfWay.explain()

== Physical Plan ==
AdaptiveSparkPlan isFinalPlan=false
+- TakeOrderedAndProject(limit=5, orderBy=[destination_total#214L DESC NULLS LAST], output=[DEST_COUNTRY_NAME#157,destination_total#214L])
   +- HashAggregate(keys=[DEST_COUNTRY_NAME#157], functions=[sum(count#159)])
      +- Exchange hashpartitioning(DEST_COUNTRY_NAME#157, 200), ENSURE_REQUIREMENTS, [id=#444]
         +- HashAggregate(keys=[DEST_COUNTRY_NAME#157], functions=[partial_sum(count#159)])
            +- FileScan csv [DEST_COUNTRY_NAME#157,count#159] Batched: false, DataFilters: [], Format: CSV, Location: InMemoryFileIndex(1 paths)[file:/Users/arpitjain/Downloads/Spark-The-Definitive-Guide-master/data..., PartitionFilters: [], PushedFilters: [], ReadSchema: struct<DEST_COUNTRY_NAME:string,count:int>

Chapter 2 - page# 36 in PDF
- [What is Big Data and how it started](#what-is-big-data-and-how-it-started)
- [Big Data Platform Requirements](#big-data-platform-requirements)
- [HADOOP architecture, history and its evolution](#hadoop-architecture-history-and-its-evolution)
- [Enterprise Data Management Requirements](#enterprise-data-management-requirements)
- [Need of distributed data storage and processing](#need-of-distributed-data-storage-and-processing)
- [Datalake concept](#datalake-concept)
- [Data Warehouse vs Data Lake](#data-warehouse-vs-data-lake)
- [Matured Data Lake concept solving original Data Requirements (Collection / Ingestion, Storage, Processing, Retrieval)](#matured-data-lake-concept-solving-original-data-requirements-collection--ingestion-storage-processing-retrieval)
- [How Data Lake fulfills data managemnet requirements](#how-data-lake-fulfills-data-managemnet-requirements)
- [HADOOP Ecosystem](#hadoop-ecosystem)
- [What is Spark](#what-is-spark)
- [Spark core](#spark-core)
- [Why Spark](#why-spark)
- [Spark Development environments](#spark-development-environments)
- [Installation](#installation)
- [Run Hello World program](#run-hello-world-program)
- [Spark execution modes](#spark-execution-modes)
- [Driver, Executors and Driver memory, Driver cores in the light of execution modes](#driver-executors-and-driver-memory-driver-cores-in-the-light-of-execution-modes)
- [What happens, when you submit your job to Spark cluster](#what-happens-when-you-submit-your-job-to-spark-cluster)
- [How Spark works on local machine](#how-spark-works-on-local-machine)
- [How Spark program runs](#how-spark-program-runs)
- [Run Hello World program](#run-hello-world-program-1)

# What is Big Data and how it started
The COBOL, also known as Common Business-Oriented Language, was the first of its kind.COBOL allowed us to store data in files, create index files, and process data efficiently. However, we saw data processing shift from COBOL to relational databases such as Oracle and Microsoft SQL Server.

You can think of COBOL as the first serious attempt towards enabling data processing.And COBOL was designed in 1959.The Oracle database achieved the subsequent major success in enabling data processing.And Oracle was founded in 1977.So data processing has always been at the centre of the Software industry. Everything else will come and go, but data will only grow.

We have used RDBMS technology for many decades.Some popular RDBMS systems are Oracle, SQL Server, PostgreSQL, MySQL, Teradata, and Exadata.

These RDBMS systems offered us three main features to help us develop Data Processing applications.
1.  SQL -An easy Data Query Language
2.  Scripting Languages such as PL/SQL and Transact SQL
3.  Interface for other programming languages such as JDBC and ODBCSo we used SQL for querying data and PL/SQL for doing things that we couldn't do using SQL.

They also offered interfaces such as ODBC/JDBC so we could interact with data using the programming languages. We could create data processing applications using these technologies.

# Big Data Platform Requirements
1.  Store high volumes of data rriving at a higher velocity
2.  Accomodate structured, semi-structured and unstructured  data variety 
3.  Process high volumes of a variety of a data at higher velocity

---

There were two approaches to solve the big data problem:
1.  The monolithic approach designs one large and robust system that handles all the requirements. Teradata and Exadata are examples. These two systems mainly support only structured data. So we cannot call them big data systems, but they are designed using a monolithic approach.
2.  The distributed approach takes many smaller systems and bring them together to solve a bigger problem.

| Criteria                | Monolithic Approach         | Monolithic Approach     |
| :---                    |:----                        | :---                    |
| Scalability             | Vertical                    | Horizontal              |
| Fault Tolerencend HA    | Primary/Secondary           | Multifold               |
| Cost effectiveness      | Expensive                   | Economical              |


Hadoop came up as a new data processing platform to solve Big Data problems.

The Hadoop platform was designed and developed in layers.The core platform layer offered three capabilities:
1. Distributed cluster formation or Cluster Operating System (YARN)
2. Data storage and retrieval on the distributed cluster or Distributed Storage (HDFS)
3. Distributed data processing using Java programming language or Map-Reduce Framework (MapReduce)

Here is a comparison between Database and Hadoop.

<img width="876" alt="image" src="https://user-images.githubusercontent.com/8909535/167280286-2b33bc0c-0627-4361-85af-92e65e5bcb0d.png">

# HADOOP architecture, history and its evolution
Hadoop is a distributed data processing platform that offers three core capabilities listed below:
1.  YARN - Cluster Resource Manager
    YARN is the Hadoop cluster resource manager. It allows multiple applications to run on the Hadoop Cluster and share resources amongst the applications. 
    YARN has 3 components - 
    * RM - Resource Manager
    * NM - Node Manager
    * AM - Application Master

    Assume we installed Hadoop, and now these five computers form a Hadoop cluster. Hadoop uses a master-slave architecture.So one of these machines will become the master, and the remaining will act as the worker node. 

<img width="820" alt="image" src="https://user-images.githubusercontent.com/8909535/167281392-0ffe0bc7-703e-41f2-bb7a-deb7fd6935e4.png">

<p>We have a five-node cluster - One node acts as a master and runs the YARN resource manager service. The other four nodes act as a Worker and run a node manager service.

The node manager will regularly send the node status report to the resource manager. 

For running an application on Hadoop, you must submit the application to the YARN resource manager. Assume you submitted a Java application to the YARN using a command line submit tool. 
  
Now the resource manager should run this application on the cluster.So, the resource manager will request one of the node managers to start a resource container and run an AM (application master) in the container.  And your application starts running inside the Application Master container.So, we submit our application to the Resource Manager.
  
The resource manager requests the node manager for allocating an application master container and starting your application inside the AM container. Each application on YARN runs inside a different AM container.If you have ten applications running in parallel, you will see 10 AM containers on your Hadoop cluster.
</p>

3.  HDFS - Distributed Storage
<p>
The HDFS stands for Hadoop Distributed File system, and it allows you to save and retrieve data files in the Hadoop Cluster.The HDFS has the following components.
</p>

  * Name Node (NN)
  * Data Node (DN)

  <img width="824" alt="image" src="https://user-images.githubusercontent.com/8909535/167281534-ea583b56-d1df-49d4-be1f-0328d632be61.png">

<p>
Assume we have five computers shown below. We already installed Hadoop on these computers and created a Hadoop cluster. 
  
Hadoop will install the Name Node service on the master.And each worker node runs a data node service. 

The name node with the data node service forms the HDFS. The primary purpose of the HDFS is to allow us to save files on this Hadoop cluster and read them whenever required.

</p>
  


4.  Map/Reduce - Distributed Computing
<p>
Map-reduce is a programming model and a framework. A programming model is a technique or a way of solving problems. The M/R framework is a set of APIs and services that allow you to apply the map-reduce programming model.
  
Hadoop taught us the map-reduce programming modal and also offered a Map-Reduce programming framework to implement it.
  
Problem in hand:
  
You have to count the lines in a 20 TB CSV file. 
  
There are two challenges in this problem statement:
1.Huge file size, It is hard to find machines to store 20 TB of data. And this problem becomes more complex if we grow the size in petabytes.
2.We also have a processing time problem. A simple line count on a 20 TB file takes hours or days.

  <img width="803" alt="image" src="https://user-images.githubusercontent.com/8909535/167281621-5ccdc496-5ad8-4276-b606-dcd45808c462.png">

  How to use M/R to solve this problem
  
  Hadoop offered to solution to both problems we discussed in the previous slide. You can use the Hadoop cluster to store the file. Let's assume you have a 21 node Hadoop cluster. One node becomes the master, and the other 20 nodes are the workers. HDFS runs a name node in the master and a data node on the other workers. YARN runs a Resource Manager on the master, and Node Manager runs on the workers. So we have those services running on the cluster.

  You can use HDFS to copy your 20 TB file on this cluster. HDFS will break the file into small 128 MB blocks and spread them across the cluster. So some data nodes will sore data blocks, and altogether they can easily store your 20 TB file. Your storage problem is taken care of by the Hadoop cluster. If you need more storage, you can increase the cluster size and add more computers.

  Now let us come to the processing time problem. I have broken my logic into two part which you can see in the image below. The first part is known as the Map function. The second part is known as the Reduce function. The old logic was to open the file and count the lines. And the new logic is almost the same as old logic. But the map function opens the file block and counts the lines. And the old logic opens the file and counts the lines.

  I can run the map function on all the data nodes in parallel. This map() function will open each block on the data node and count the lines. End of the execution, I will have the number of lines in the blocks at the given data node. I am counting lines on 14 data nodes in parallel. Everything runs at the same time. And I will get the line counts in 1/14th of the time compared to doing it on a single machine. However, I will have 14 line counts. Each count represents the number of lines on their respective data node.

  Then, I will start a Reduce function at one node. All the data node will send their counts to the reduce function. The reduce function will receive 14 line counts in an array. So I will look through the array and sum up all the line counts. The reduce function will loop through the list of counts and sum it up. And the sum is the number of lines in the file.

  <img width="837" alt="image" src="https://user-images.githubusercontent.com/8909535/167281669-7e33b8f1-ab85-452b-a130-adc825845427.png">

  Here is the summarized context of Map Reduce.

  <img width="448" alt="image" src="https://user-images.githubusercontent.com/8909535/167281675-b3709b16-cfb0-4a50-bce9-1a7c07c6dffc.png">

</p>

# Enterprise Data Management Requirements
* Collection / Ingestion
* Storage
* Processing
* Retrieval

# Need of distributed data storage and processing
<p>
Vertical scalability was fine until data volumes and processing/computation power/needs grown to a unmanagable level with vertical scalaibility.

Before Distributed processing, Data warehouses (Teradata, Exadata etc.) were very successful using vertical scalability (high capital cost).

Google was the company to realize this, do research and create abusiness around it. Google started trying to solve above "Data Requirements" at larger scale.

Google released 2 whitepapers to solve Data Storage and Processing needs via GFS (2003) and MapReduce (2004) respectively. These whitepapers led to the invention of HDFS and Hadoop MapReduce.

The open-source community well appreciated these whitepapers, and they formed the basis for the design and the development of a similar open-source implementation –The Hadoop. The open-source community implemented the GFS as a Hadoop Distributed File System –HDFS. They applied Google MR as the Hadoop MapReduce programming framework.Hadoop grabbed immense attention and popularity among organizations and professionals.Since the development of Hadoop, there have been many other solutions developed over the Hadoop platform and open-sourced by various organizations.Some of the most widely adopted systems were Pig, Hive, and HBase.

<img width="661" alt="image" src="https://user-images.githubusercontent.com/8909535/167281981-4d46157c-a9e0-4717-beb5-652f56191dae.png">


Apache Hive was one of the most popular components of Hadoop. Hive offered the following core capabilities on the Hadoop Platform:
    1. Create Databases, Tables, and Views
    2. Run SQL Queries on the Hive Tables
    
So Hive simplified using Hadoop. Application developers struggled to solve data processing problems using Map Reduce. 
    
Hive came to the rescue. It allowed us to create databases and tables using DDL Statement.Then they also allowed us to use SQL queries on the table.The majority of the development workforce was familiar with the RDBMS, and they already knew SQL.So using SQL was easy to adopt.
    
Hive SQL engine internally translated SQL queries into M/R programs.But application developers were saved from writing Map Reduce code in Java.

Hadoop as a platform and Hive as a Hadoop database became very popular.But we still had the following problems which needed improvements:
    1. Performance
    2. Ease of development
    3. Language support
    4. Storage 
    5. Resource Management

Spark advantages over HADOOP
<img width="847" alt="image" src="https://user-images.githubusercontent.com/8909535/167282075-aaca54f8-7fa1-4d28-8912-dbe2c22911f4.png">

</p>

# HADOOP vs Data warehouse

# Datalake concept
Challenges with vertical scalability & high capital cost inspired James Dixon, the CTO of Pentaho to come up with a new concept called 'Data Lake' in Oct 2010.

Inititally Data Lake was synonymous with Hadoop but overtime, lot of things evolved like cloud infrastructure in Data Lake.
<img width="1189" alt="image" src="https://user-images.githubusercontent.com/8909535/167073653-5344c3a2-8408-4076-bace-1c007d12548a.png"> 


# Data Warehouse vs Data Lake
![image](https://user-images.githubusercontent.com/8909535/167074141-2ac1aa26-e1f3-4bcc-b119-9de1353ea361.png)

# Matured Data Lake concept solving original Data Requirements (Collection / Ingestion, Storage, Processing, Retrieval)
<img width="1207" alt="image" src="https://user-images.githubusercontent.com/8909535/167073909-5c46aac3-0a05-422f-b494-605a175fc584.png">

# How Data Lake fulfills data managemnet requirements
* Collection / Ingestion
  - Ingestion in Data LAke is all about identifying, implementing and managing right tools to bring data from the source system to the Data Lake. There is no single tool, which solve the purpose in all the usecases and hence, many vendors are competing in this place. 
 
* Storage
  - The core of the data Lake platform is storage infrastructure. In today's Data Lake, this could be an on-premise HDFS or cloud storage i.e. AWS  S3, Azure Blob, Google Cloud storage etc. Cloud storage is leading because, they offer scalability and high availability access at extremely low cost almost no time to procure.

* Processing - This is the place where all computation is going to happen, which involves initial data quality check, trasforming and preparing the data, correlating, aggregating, analyzing and extracting some business insights, applying ML models. But, we want to do all these on large scale, so this layer is broken further into two parts to manage things and separate out the responsibilities.
  - Data processing framework - Core framework to sign and develop distributed computing applications. Apache Spark falls in this place and many similiar things. We have 3 comptetitors - YARN, Mesos and Apache Kubernetes 
  - Orchestration system - Responsible for the formation of the cluster, managing the resources and scaling up/down.
* Retrieval - Most critical capability of a data lake is to allow you to consume data from data lake. Think of a data lake as a repository of a raw and processed data. Consumption is all about tting  data for real life usage. Consumption requirements come in all required formats. Consumers could be Data lysts and data scientists oking to access data from the lake, apps, dashboards interested in gregated lts and insights. Some of them would ask you to allow to access lake data via JDBC/ODBC connections or REST interface. Experimenting  scientists might be interested in ssing files. To serve all different consumption requirements, there are many competitors too in this space.

Other capabilities are needed complete the data lake implementation. The most critical ones are - 
* Security and Access Control 
* Scheduling & Workflow
* Data catalogue & Metadata management
* Data lifecycle and governance
* Operations and Monitoring

# HADOOP Ecosystem
<img width="1601" alt="image" src="https://user-images.githubusercontent.com/8909535/167064327-8ed4ce01-7167-4c0e-bafe-f0d127e1c080.png">


# What is Spark
Apache Spark started at UC Berkeley in 2009, and open sourced in 2010 under a BSD license. In 2013, the project was donated to the Apache Software Foundation and switched its license to Apache 2.0. In February 2014, Spark became a Top-Level Apache Project.

Apache Spark™ is a multi-language engine for executing data engineering, data science, and machine learning on single-node machines or clusters.

<img width="940" alt="image" src="https://user-images.githubusercontent.com/8909535/167127156-0cecc9c8-905a-4087-9cba-5d81b439f285.png">

* General Execution: Spark Core - Spark Core is the underlying general execution engine for the Spark platform that all other functionality is built on top of. It provides in-memory computing capabilities to deliver speed, a generalized execution model to support a wide variety of applications, and Java, Scala, and Python APIs for ease of development.

* Structured Data: Spark SQL - Many data scientists, analysts, and general business intelligence users rely on interactive SQL queries for exploring data. Spark SQL is a Spark module for structured data processing. It provides a programming abstraction called DataFrames and can also act as distributed SQL query engine. It enables unmodified Hadoop Hive queries to run up to 100x faster on existing deployments and data. It also provides powerful integration with the rest of the Spark ecosystem (e.g., integrating SQL query processing with machine learning).

* Streaming Analytics: Spark Streaming - Many applications need the ability to process and analyze not only batch data, but also streams of new data in real-time. Running on top of Spark, Spark Streaming enables powerful interactive and analytical applications across both streaming and historical data, while inheriting Spark’s ease of use and fault tolerance characteristics. It readily integrates with a wide variety of popular data sources, including HDFS, Flume, Kafka, and Twitter.
 
* Machine Learning: MLlib - Machine learning has quickly emerged as a critical piece in mining Big Data for actionable insights. Built on top of Spark, MLlib is a scalable machine learning library that delivers both high-quality algorithms (e.g., multiple iterations to increase accuracy) and blazing speed (up to 100x faster than MapReduce). The library is usable in Java, Scala, and Python as part of Spark applications, so that you can include it in complete workflows. 

* Graph Computation: GraphX - GraphX is a graph computation engine built on top of Spark that enables users to interactively build, transform and reason about graph structured data at scale. It comes complete with a library of common algorithms.

# Spark core
* Spark Compute Engine
Apache Spark doesn't offer - Cluster management and Storage management. All you can do with Spark is to run your a processing workload and this is managed by Spark compute engine. Spark compute engine is responsible for bunch of things -
  -  Breaking your data processing work into  smaller task
  -  Scheduling those tasks on the cluster parallel execution
  -  Providing data to these tasks
  -  Managing and monitoring those tasks
  -  Providing fault tolerence when job fails
 
And to do all these, e engine is also responsible  interacting with the cluster manager and data storage manager. So the Spark compute engine is the core that runs and manages your data processingrk and provides u a seemless experience. All you need to do is submit your data processing jobs to Spark and Spark Core is going to take of everything else. 

* APIs
Layer that offers core APIs in 4 programming languages. These are the APIs, that we used to write data processing logic during the initial days of the Apache Spark. These APIs were based on RDDs (Resilient Distributed Datasets) and people found them a little tricky to learn use them for their day to day data processing work. Some people still use them today, however these APIs are the hardest y to work with Apache Spark. They also lack some performance optimization features and Spark creators are recommending them to avoid as much as possible, however these APIs can offer you the highest level of flxibility solve some complex data processing problems.

* Spark SQL and Dataframes/Dataset , Streamingm, Mlib, GraphX
This layer is the prime area of interest for most of the Spark developers and data scientists. This layer is again a set of libraries, packages, APIs and DSL. These are developed by the Spark community ver and above the e APIs, so we will be using these top-level Is and DSLs but internally all of these  will be using Spark Core APIS and ultimately ngs will go to Spark Compute engine.

Spark exists on two kinds of platforms:
1. On Hadoop Platform - Data Lake
2. On Cloud Platform - LakehouseWe use the Hadoop platform as the Data Lake platform, and the primary developer technology on Hadoop Data Lake is now Apache Spark.Map/Reduce Framework is gone away forever, and Hive is also losing its place for Spark SQL.


# Why Spark
These 3 things make Spark a super popular distributed computing platform for data procesing.
* Abstraction
Spark will abstract away the fact that you are coding to execute ur program on a cluster of computers. In the best-case scenario, you will be working with tables and g SQL queries. You will feel like working with database. In the worst-case scenario, you will be working with RDDs and Dataframes. All the complexities of distributed storage, computation and parallel programming is abstracted away by the Spark core.
* Unified Platform
Spark combines the capabilities of the SQL queries, Batch processing, Stream processing, Structured and Semi-Structured handling, Graph processing, ML and deep learning. All of this in single framework using your favorite programming language. 
* Ease of use
If you compare with Hadoop and MapReduce code, Spark code is much rter, simple, easy to read understand. You also have a growing and evolving ecosystem to offer ready to use libraries, algorithms and integrations with a wide variety of other systems.

# Spark Development environments
Local - command line RPEL
  - Data storage ?
PyCharm
  - Data storage ?
Databricks notebooks
  * Sign up with Databricks community edition (email, debit/credit card and with AWS/Azure/GCP account)
  
Anaconda / Other notebooks
  - Data storage  - local filesystem - yes, HDFS, S3?
  - How to run Spark notebook - findspark not found???
  
  * Install Anakonda individual edition
  * Set SPARK_HOME
  * Install findspark
  * Initialize findspark (connection between Anaconda Python env and Spark installation

Cloud Offerings like AWS EMR, GCP Dataproc, Azure HDInsight


# Installation

# Run Hello World program
* How to create Spark program
* How to run Spark program 
  - Interactive clients - for learning/development phase, best for exploration purposes - ex. - spark-shell, notebooks 
  - Submit job - production usecases - package your jon abd submit it to Spark cluster for execution - spark-submit
    Apache Spark comes with spark-submit utility to allow you to submit your job to spark cluster

# Spark execution modes
  - Local
  - Client
  - Cluster

    Notebooks can run in Client (if running from local machine) and cluster (if running from cloud i.e. databricks or AWS, Azure, GCP etc. ???
  * When to use what


# Driver, Executors and Driver memory, Driver cores in the light of execution modes

# What happens, when you submit your job to Spark cluster

# How Spark works on local machine

# How Spark program runs

# Run Hello World program

# Spark sample queries
## find the top five destination countries in the data
val flightData2015 = spark.read.option("header","true").option("inferSchema","true").csv("flight-data/csv/2015-summary.csv")

spark-sql way

flightData2015.createOrReplaceTempView("flightData2015")
spark.sql("""select dest_country_name, sum(count) from flightData2015 group by dest_country_name order by sum( count) desc limit 5""").show()

spark dataframe way

import org.apache.spark.sql.functions.desc
flightData2015.groupBy("DEST_COUNTRY_NAME").sum("count").withColumnRenamed("sum(count)", "destination_total").sort( desc("destination_total")).limit(5).show()

#questions
* Executor/Slave (of a runing program) vs Worker of a multi-node cluster?
* spark-submit --help (is it for local or client mode ?)
* spark-shell --help (is it for cluster mode ?)
* spark session - Driver object
* spark context - can get context from session. context will have conf object
* cluster manager - can bedefined as master via spark-shell, spark-submit or a method od spark session (Driver)

in code, where do we specify master (cluster manager) - how to differentiate local env vs higher envs
 => via spark-submit command line options

* Spark session config precedence

* real project
  - log management
  - conf management
---
Datalake - other additonal capabilities - Security, Workflow, Metadata, Data lifecycle, Monitoring, Operations
---
How Spark SQL can help in processing semi-structured data
---
New concepts like Dataframes and Datasets are part of Spark Core APIs only..? in notes, it was mentioned they are RDD based.
---
What are job stages while running a cell in notebook?
---
Why its not getting sorted in "01-getting-started notebook - databricks community edition"?avg_price_df = diamonds_df.select("color", "price").groupBy("color").agg(avg("price")).sort("avg(price)")
avg_price_df.show()
---
difference in running pyspark, spark-shell and spark-submit from cmd line
---
csv file and tab limited files are structured?  why? Spark - The definitive guide says on Page#22 that CSV is semi-structured
---
app log is  unstructured..why?
---
Is it true that Spark programs written in scala perform better than written in Python, as Spark is written in Scala?
---
myRange = spark.range(100000000).toDF("number")
myRange.show(100000000)
Caused by: java.lang.OutOfMemoryError: Java heap space
---
show(), take() methods on DataFrame
---
how to read explain plan of sql, dataframe?
---
which should be preferred - spark-sql of datafram way? Both the below approaches have same plan

val flightData2015 = spark.read.option("header","true").option("inferSchema","true").csv("flight-data/csv/2015-summary.csv")
flightData2015.createOrReplaceTempView("flightData2015")
-------------------------------------------------
val sqlWay = spark.sql("""SELECT DEST_COUNTRY_NAME, count(1) FROM flightData2015 GROUP BY DEST_COUNTRY_NAME """)

== Physical Plan ==
AdaptiveSparkPlan isFinalPlan=false
+- HashAggregate(keys=[DEST_COUNTRY_NAME#16], functions=[count(1)])
   +- Exchange hashpartitioning(DEST_COUNTRY_NAME#16, 200), ENSURE_REQUIREMENTS, [id=#349]
      +- HashAggregate(keys=[DEST_COUNTRY_NAME#16], functions=[partial_count(1)])
         +- FileScan csv [DEST_COUNTRY_NAME#16] Batched: false, DataFilters: [], Format: CSV, Location: InMemoryFileIndex(1 paths)[file:/Users/arpitjain/Downloads/Spark-The-Definitive-Guide-master/data..., PartitionFilters: [], PushedFilters: [], ReadSchema: struct<DEST_COUNTRY_NAME:string>

val dataFrameWay = flightData2015.groupBy("DEST_COUNTRY_NAME").count()
== Physical Plan ==
AdaptiveSparkPlan isFinalPlan=false
+- HashAggregate(keys=[DEST_COUNTRY_NAME#199], functions=[count(1)])
   +- Exchange hashpartitioning(DEST_COUNTRY_NAME#199, 200), ENSURE_REQUIREMENTS, [id=#606]
      +- HashAggregate(keys=[DEST_COUNTRY_NAME#199], functions=[partial_count(1)])
         +- FileScan csv [DEST_COUNTRY_NAME#199] Batched: false, DataFilters: [], Format: CSV, Location: InMemoryFileIndex(1 paths)[file:/Users/arpitjain/Downloads/Spark-The-Definitive-Guide-master/data..., PartitionFilters: [], PushedFilters: [], ReadSchema: struct<DEST_COUNTRY_NAME:string>

---
How to understand explain plan of a dataframe

find the top five destination countries in the data
val flightData2015 = spark.read.option("header","true").option("inferSchema","true").csv("flight-data/csv/2015-summary.csv")

spark dataframe way

import org.apache.spark.sql.functions.desc
val dfWay = flightData2015.groupBy("DEST_COUNTRY_NAME").sum("count").withColumnRenamed("sum(count)", "destination_total").sort( desc("destination_total")).limit(5)

dfWay.explain(mode="formatted")
== Physical Plan ==
AdaptiveSparkPlan (6)
+- TakeOrderedAndProject (5)
   +- HashAggregate (4)
      +- Exchange (3)
         +- HashAggregate (2)
            +- Scan csv  (1)


(1) Scan csv 
Output [2]: [DEST_COUNTRY_NAME#157, count#159]
Batched: false
Location: InMemoryFileIndex [file:/Users/arpitjain/Downloads/Spark-The-Definitive-Guide-master/data/flight-data/csv/2015-summary.csv]
ReadSchema: struct<DEST_COUNTRY_NAME:string,count:int>

(2) HashAggregate
Input [2]: [DEST_COUNTRY_NAME#157, count#159]
Keys [1]: [DEST_COUNTRY_NAME#157]
Functions [1]: [partial_sum(count#159)]
Aggregate Attributes [1]: [sum#217L]
Results [2]: [DEST_COUNTRY_NAME#157, sum#218L]

(3) Exchange
Input [2]: [DEST_COUNTRY_NAME#157, sum#218L]
Arguments: hashpartitioning(DEST_COUNTRY_NAME#157, 200), ENSURE_REQUIREMENTS, [id=#444]

(4) HashAggregate
Input [2]: [DEST_COUNTRY_NAME#157, sum#218L]
Keys [1]: [DEST_COUNTRY_NAME#157]
Functions [1]: [sum(count#159)]
Aggregate Attributes [1]: [sum(count#159)#210L]
Results [2]: [DEST_COUNTRY_NAME#157, sum(count#159)#210L AS destination_total#214L]

(5) TakeOrderedAndProject
Input [2]: [DEST_COUNTRY_NAME#157, destination_total#214L]
Arguments: 5, [destination_total#214L DESC NULLS LAST], [DEST_COUNTRY_NAME#157, destination_total#214L]

(6) AdaptiveSparkPlan
Output [2]: [DEST_COUNTRY_NAME#157, destination_total#214L]
Arguments: isFinalPlan=false
Chapter 2 - page# 36 in PDF

<img width="1095" alt="image" src="https://user-images.githubusercontent.com/8909535/167518071-0f854ce3-f0cc-4457-b15d-b7c060a6b784.png">

