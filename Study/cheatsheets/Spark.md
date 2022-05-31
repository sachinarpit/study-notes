# Get distinct Value of Multiple Columns
dataframe.select('ID',"NAME").distinct().show()

# pyspark show all rows
df.show(False)

# while running a py file from pycharm (directly cloned study-notes)
/usr/bin/python3 /Users/arpitjain/PycharmProjects/study-notes/Study/code/ScholarNestProjects/GivenSolutions/Week-1/HelloSpark.py
Traceback (most recent call last):
  File "/Users/arpitjain/PycharmProjects/study-notes/Study/code/ScholarNestProjects/GivenSolutions/Week-1/HelloSpark.py", line 1, in <module>
    from pyspark.sql import *
ModuleNotFoundError: No module named 'pyspark'
  
Use https://www.jetbrains.com/help/pycharm/creating-virtual-environment.html#python_create_virtual_env for creating virtual env.
