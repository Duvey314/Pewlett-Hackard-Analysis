# Pewlett-Hackard-Analysis

Pewlett-Hackard is expecting a large number of employees to retire in the near future and the positions they leave will need to be filled. To prepare for this, I have been asked to provide a list of employees retiring soon along with their titles to understand what positions will be open and facilitate a transfer of knowledge through a mentorship program. 

I was initially provided with a number of CSV files containing employee information. To analyze the relationships between these files I created an Entity Relationship Diagram seen below.

![ERD](https://github.com/Duvey314/Pewlett-Hackard-Analysis/blob/master/QuickDBD-export.png)

From this diagram I was able to create a SQL database to house these files. Then I could start to sort the data to see who is at retiring age, create new tables to store this data, and then group the data by title to see the number of each title retiring. This then helps HR to figure out what types of employees they are losing and where to focus hiring in the near future.

After sorting the data I found the count of each title retiring as seen below.

![retiring](https://github.com/Duvey314/Pewlett-Hackard-Analysis/blob/master/retiring%20titles%20counts.PNG)

The first thing that I see is that there are a lot of senir staff and engineers retiring. This is unsurprising since they tend to be more senior. This means a lot of oppurtunities for engineers and staff to take on more responsibilities and jump up to senior positions. The mentorship program will help with this greatly. The next step would be to identify candidates that have been with the company for a few years and have the potential to move into a senior position. These employees can then be matched with a mentor in their department and given a set period of time to learn the senior position. 


