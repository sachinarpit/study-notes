# Enterprise Data Management Requirements
* Collection / Ingestion
* Storage
* Processing
* Retrieval

# Need of distributed data storage and processing
Vertical scalability was fine until data volumes and processing/computation power/needs grown to a unmanagable level with vertical scalaibility.

Before Distributed processing, Data warehouses (Teradata, Exadata etc.) were very successful using vertical scalability (high capital cost).

Google was the company to realize this, do research and create abusiness around it. Google started trying to solve above "Data Requirements" at larger scale.

Google released 2 whitepapers to solve Data Storage and Processing needs via GFS (2003) and MapReduce (2004) respectively. These whitepapers led to the invention of HDFS and Hadoop MapReduce.

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

Cloud Offerings like AWS EMR, Azure Dataproc, GCP HDInsight


# Installation

# Run Hello World program

# Run Hello World program

# How Spark program runs

