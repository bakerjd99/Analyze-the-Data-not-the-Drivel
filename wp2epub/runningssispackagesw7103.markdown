[Running SSIS Packages with Python](https://analyzethedatanotthedrivel.org/2021/06/05/running-ssis-packages-with-python/) {#running-ssis-packages-with-python .unnumbered}
-------------------------------------------------------------------------------------------------------------------------

*Posted: 06 Jun 2021 15:36:15*

Microsoft's [SSIS (SQL Server Integration
Services)](https://docs.microsoft.com/en-us/sql/integration-services/sql-server-integration-services?view=sql-server-ver15)
is a ubiquitous ETL (Extract Transform and Load) tool. Despite its
widespread use, SSIS is not loved! At best, it's tolerated for its
undeniable utility, but SSIS's "utility" comes with a host of hideous
warts with the ugliest being its *file handling*.

You would think that an ETL tool would excel at file manipulation; how
else would you "extract" data? But, for reasons lost to posterity, SSIS
totally screws the file handling pooch. Now there are "sanctioned" ways
to unscrew the pooch. Use "script tasks" is a common retort. With script
tasks, you code your file handling bits in something like C\# and then
use SSIS to compile and incorporate the C\# parts into the larger ETL
process. Script tasks work but they're a pain to debug and maintain.
There are other *pooch unscrewers*. Many code everything in SQL stored
procedures, others build [GAC
dlls](https://stackoverflow.com/questions/1268342/what-is-the-gac-in-net),
some use [command
tasks](https://docs.microsoft.com/en-us/sql/integration-services/control-flow/execute-process-task?view=sql-server-ver15)
to shell out to file utilities. Sadly, the abundance of SSIS file
handling work-a-arounds just affirms that SSIS blows hard here!

I could bitch about SSIS file handling for fortnights but, bitching does
not solve problems. Luckily, there is an easy way to use SSIS's [good
bits](https://www.youtube.com/watch?v=wPiHQ37gXnE) without getting
sucked into the script task swamp.

> SSIS typically calls helper processes like script tasks, but if you
> flip things around and call SSIS from helper processes you can easily
> leverage the strengths of both SSIS and helpers.

The following Python snippet, taken from a recent project, illustrates
this technique.

``` {#lst:scr7103x0 .python language="python" frame="single" framerule="0pt" label="lst:scr7103x0"}
all_cube_zips = etl.daily_zip_files(working_dirs=rtp.working_dirs, 
                                    runtime_parms=rtp.runtime_parms)

for cnt, zipfile in enumerate(all_cube_zips):

   etl.clear_working_dirs(working_dirs=rtp.working_dirs, 
                       runtime_parms=rtp.runtime_parms, 
                       name_prefix="DailyRetails")

   dailyretail_xml_files = etl.unzip_prefix_xml(name_prefix="DailyRetails", 
                       daily_zip_file=zipfile, 
                       working_dirs=rtp.working_dirs,
                       runtime_parms=rtp.runtime_parms)

   tsv_files = dcx.write_dailyretail_tsvs(xml_files=dailyretail_xml_files, 
                       daily_zip_file=os.path.basename(zipfile), 
                       column_defaults=rcd.DailyRetails_column_defaults, 
                       working_dirs=rtp.working_dirs,
                       runtime_parms=rtp.runtime_parms,
                       append_only=False)

   os.system(r"\\Shares\DailyCode\bats\SelectReload.bat")
```

This Python program unzips hundreds of XML files to a working directory
and then "flattens" them to a simple TAB delimited text file. This is
typical ETL stuff. After writing the TAB delimited file Python runs a
simple batch script to execute an SSIS package. The batch script is
called with:

``` {#lst:scr7103x1 .python language="python" frame="single" framerule="0pt" label="lst:scr7103x1"}
 os.system(r"\\Shares\DailyCode\bats\SelectReload.bat")
```

The following script lines from `SelectReload.bat` show how to set up
and run a package with
[`dtexec.exe`](https://docs.microsoft.com/en-us/sql/integration-services/packages/dtexec-utility?view=sql-server-ver15).

    [language=, frame=single, framerule=0pt, label=lst:scr7103x2]
     rem change to your dtexec directory
     cd "c:\Program Files\Microsoft SQL Server\150\DTS\Binn"
     rem execute an SSIS package - use fully qualified paths
     dtexec /Project "\\Shares\DailyCode\ispacs\flat.ispac" /Package Reloads.dtsx
     if %ERRORLEVEL% NEQ 0 goto Error18

Here, all the irritating file hacking is done with Python leaving
streamlined ETL jobs for SSIS. Both processes are simplified. Both are
easy to test and debug. With software, it's always wise to try simple
first.

As a final warning, before you adopt this approach be aware that you
need full ["Administrative
Rights"](https://www.makeuseof.com/tag/windows-admin-rights/) to run
`dtexec.com` like this. Many anally retentive IT outfits will simply
outlaw such renegade scripting. If you're incarcerated in
*Administrative Rights* jail I'd suggest taking advantage of the
[current labor
shortage](https://inthesetimes.com/article/labor-shortage-jobs-report-low-wages-biden-covid)
and find another job. Squabbling over administrative rights is a
demeaning waste of IT talent that can no longer be tolerated.
