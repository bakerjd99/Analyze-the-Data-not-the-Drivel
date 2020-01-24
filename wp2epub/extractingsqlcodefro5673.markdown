
[Extracting SQL code 
from SSIS dtsx packages with Python lxml](http://analyzethedatanotthedrivel.org/2020/01/20/extracting-sql-code-from-ssis-dtsx-packages-with-python-lxml/)
---------------------------------------------------------------------------------------------------------------------------------------------------------

*Posted: 21 Jan 2020 02:30:48*

Lately, I’ve been refactoring a sprawling SSIS [(SQL Server Integration
Services)](https://docs.microsoft.com/en-us/sql/integration-services/sql-server-integration-services?view=sql-server-ver15)
package that ineffectually wrestles with large XML files. In this
programmer’s opinion using SSIS for heavy-duty XML parsing is geeky
self-abuse so I’ve opted to replace an eye-ball straining[^1x5673] SSIS
package with half a dozen, [“as simple as possible but no
simpler”](https://quoteinvestigator.com/2011/05/13/einstein-simple/),
Python scripts. If the Python is fast enough for production great! If
not the scripts will serve as a clear model[^2x5673] for something faster.

I’m only refactoring[^3x5673] part of a larger
[ETL](https://www.webopedia.com/TERM/E/ETL.html) process so whatever I
do *it must mesh with the rest of the mess.*

***So where is the rest of the SSIS mess?***

SSIS’s visual editor does a wonderful job of hiding the damn code!

***This is a problem!***

If only there was a simple way to troll through large sprawling SSIS
*spider-webby* packages and extract [the good
bits](https://www.youtube.com/watch?v=wPiHQ37gXnE). Fortunately,
Python’s XML parsing tools can be easily applied to SSIS `dtsx` files.
*SSIS `dtsx` files are XML files.* The following code snippets
illustrate how to hack these files.

First import the required Python modules. `lxml` is not always included
in Python distributions. Use the
[pip](https://remotedevdaily.com/how-to-install-lxml-in-python-using-pip/)
or [conda](https://anaconda.org/anaconda/lxml) tools to install this
module.

    # imports
    import os
    from lxml import etree

Set an output directory. I’m running on a Windows machine. If you’re on
a Mac or Linux machine adjust the path.

    # set sql output directory
    sql_out = r"C:\temp\dtsxsql"
    if not os.path.isdir(sql_out):
        os.makedirs(sql_out)

Point to the `dtsx` package you want to extract code from.

    # dtsx files
    dtsx_path = r'C:\Users\john\AnacondaProjects\testfolder\bixml'
    ssis_dtsx = dtsx_path + r'\ParseXML.dtsx'

Read and parse the SSIS package.

    tree = etree.parse(ssis_dtsx)
    root = tree.getroot()

`lxml` renders XML namespace tags like `<DTS:Executable` as
`www.microsoft.com/SqlServer/Dts\}Executable`. The following gathers all
the transformed element tags in the `dtsx` package.

    # collect unique element tags in dtsx
    ele_set = set()
    for ele in root.xpath(".//*"):
        ele_set.add(ele.tag)    
    print(ele_set)
    print(len(ele_set))

Using transformed element tags of interest blast over the `dtsx` and
suck out the bits of interest.

    # extract sql code in source statements and write to *.sql files 
    total_bytes = 0
    package_name = root.attrib['{www.microsoft.com/SqlServer/Dts}ObjectName'].replace(" ","")
    for cnt, ele in enumerate(root.xpath(".//*")):
      if ele.tag == "{www.microsoft.com/SqlServer/Dts}Executable":
        attr = ele.attrib
        for child0 in ele:
          if child0.tag == "{www.microsoft.com/SqlServer/Dts}ObjectData":
            for child1 in child0:
              sql_comment = attr["{www.microsoft.com/SqlServer/Dts}ObjectName"].strip()
              if child1.tag == "{www.microsoft.com/sqlserver/dts/tasks/sqltask}SqlTaskData":
                dtsx_sql = child1.attrib["{www.microsoft.com/sqlserver/dts/tasks/sqltask}SqlStatementSource"]
                dtsx_sql = "-- " + sql_comment + "\n" + dtsx_sql
                sql_file = sql_out + "\\" + package_name + str(cnt) + ".sql"
                total_bytes += len(dtsx_sql)
                print((len(dtsx_sql), sql_comment, sql_file))
                with open(sql_file, "w") as file:
                  file.write(dtsx_sql)
    print(('total sql code bytes',total_bytes))

The code snippets in this post are available in this Jupyter notebook:
[Extracting SQL code from SSIS dtsx packages with Python
lxml](https://github.com/bakerjd99/jacks/blob/master/notebooks/Extracting%20SQL%20code%20from%20SSIS%20dtsx%20packages%20with%20Python%20lxml.ipynb).
*Download and tweak for your `dtsx` nightmare!*

[^1x5673]: I frequently run into SSIS packages that cannot be viewed on `4K`
    monitors when fully zoomed out.

[^2x5673]: Python’s readability is a major asset when disentangling
    *mess-ware*.

[^3x573]: Yes, I’ve railed about the word “refactoring” in the past but I’ve
    moved on and so should you. [“A foolish consistency is the hobgoblin
    of little
    minds.”](https://www.dictionary.com/browse/a-foolish-consistency-is-the-hobgoblin-of-little-minds)
