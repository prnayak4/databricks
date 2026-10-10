# Databricks notebook source
# /// script
# [tool.databricks.environment]
# environment_version = "6"
# ///
# MAGIC %sql
# MAGIC create table data_dev.default.test(
# MAGIC id int, name string
# MAGIC )
# MAGIC using delta

# COMMAND ----------

# MAGIC %sql
# MAGIC insert into data_dev.default.test values (1, 'manish')

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from data_dev.default.test

# COMMAND ----------

# MAGIC %sql
# MAGIC drop table if exists data_dev.default.test