 
[A C\# .Net Class for calling J](http://bakerjd99.wordpress.com/2010/05/28/a-c-net-class-for-calling-j/)
--------------------------------------------------------------------------------------------------------

*Posted: 28 May 2010 14:48:18*

One of my [favorite programming tools is J](http://www.jsoftware.com/).
In skilled hands *J is a spear in a world of bent spoons.* In my day job
I rarely encounter programming problems that cannot be brutally
dispatched with a few dozen lines of J. Most accomplished [J
programmers](http://www.lulu.com/product/paperback/j-for-c-programmers/4669553)
laud the [elegance and power of the
language](http://portal.acm.org/citation.cfm?id=508562) and frequently
remark on how learning J changed the way the way they think about
programming. If you are intrigued please take a look but a word of
caution. Learning J is like learning Calculus. Don’t expect to progress
beyond the trivial without a [substantial intellectual
effort](http://norvig.com/21-days.html) on your behalf.

J has many strengths but current implementations also have some serious
shortcomings.

1.  J’s GUI user interface tools are primitive compared to what you find
    in Microsoft Visual Studio or Java Eclipse environments.

2.  It is difficult to use J in mixed language projects. J can make C
    style API calls and the Windows version sports a COM interface. Both
    of these call mechanisms are solid and work well but the C API
    struggles with many C++ libraries and COM is now considered a legacy
    technology in Microsoft .Net circles.

3.  .Net executables can call J but J cannot *easily* call .Net
    executables.

4.  There are very few useful J libraries.
    [Python](http://pypi.python.org/pypi/) programmers often find
    complete solutions to their problems in libraries. With J you often
    end up writing your own libraries This fosters an independent frame
    of mind at the expense of productivity.

5.  Packaging J solutions is largely *ad hoc* and platform dependent.
    It’s not like C\# or Java where you get a nice self-contained
    install package.

To deal with J’s deficiencies I cheat and use other languages and tools.
This is getting the best of both worlds or [Miley
Cryrus](http://www.stlyrics.com/lyrics/hannahmontana/bestofbothworlds.htm)’ing
it! Miley Cryus’ing in Windows environments leads straight to .Net and
the premier .Net programming language C\#. J is not a .Net language but
J can be called from C\# by COM or by C style API calls. This
[JServer](http://cid-f964330e36001519.skydrive.live.com/self.aspx/Public/cs/JServer10may27.zip)
class uses COM. JServer was inspired by Alex Rufon’s [J Wiki
essay](http://202.67.223.49/jwiki/Guides/J%20CSharp) but differs in that
all JServer calls are strongly typed. There is no point in using
strongly typed languages like C\# if you are constantly casting objects.
Use the type checking Luke!

The following
[JServerTest](http://cid-f964330e36001519.skydrive.live.com/self.aspx/Public/cs/JServerTest10may27.zip)
code snippet shows JServer calls.

    using System;
    using System.Collections.Generic;
    using System.Text;
    using System.Data;
    using JServerClass;  // add reference to JServer.exe

    namespace JServerTest
    {
        class Program
        {
            static void Main(string[] args)
            {
                // create new j exe server - load only the j profile
                JServer js = new JServer(JServer.JScriptType.OnlyProfile);

                // make server visible/invisible/visible
                js.jShowServer = true;
                System.Threading.Thread.Sleep(200);
                js.jShowServer = false;
                System.Threading.Thread.Sleep(200);
                js.jShowServer = true;

                // do tests - create j nouns that interface can fetch

                js.jDo("18!:5 ''"); // should be in base locale

                // atoms - rank 0
                js.jDo("byteAtom=. 'A'");
                js.jDo("boolAtom=. 1");
                js.jDo("intAtom=. 42");
                js.jDo("doubleAtom=. 1x1"); // e in j notation

                // arrays of rank 1 and 2 - higher rank arrays are not
                // explicitly supported by the C# interface
                js.jDo("boolArray=. ?50#2");
                js.jDo("intArray=. 10 10$?100#10");
                js.jDo("doubleArray=. 5 10$(?50#50) % ?50#50");
                js.jDo("byteArray=. 20 30$'goaheadbyteme'");
                js.jDo("stringArray=. ;:'not by the hair of my chinny chin chin'");
                js.jDo("stringArray2=. 11 7$stringArray");

                // get tests - fetch j nouns - get and set are C# overloads

                // rank 0 gets
                byte byteAtom;
                js.jGet("byteAtom", out byteAtom);
                bool boolAtom;
                js.jGet("boolAtom", out boolAtom);
                int intAtom;
                js.jGet("intAtom", out intAtom);
                double doubleAtom;
                js.jGet("doubleAtom", out doubleAtom);

                // rank 1 and/or 2 gets
                bool[] boolArray;
                js.jGet("boolArray", out boolArray);
                int[,] intArray;
                js.jGet("intArray", out intArray);
                double[,] doubleArray;
                js.jGet("doubleArray", out doubleArray);
                byte[,] byteArray;
                js.jGet("byteArray", out byteArray);
                string[] stringArray;
                js.jGet("stringArray", out stringArray);
                string[,] stringArray2;
                js.jGet("stringArray2", out stringArray2);

                // set tests - set copies of fetched nouns in j and test
                js.jSet("byteAtomC", byteAtom);
                js.jDo("byteAtom -: byteAtomC");   // should be identical - result 1
                js.jSet("boolAtomC", boolAtom);
                js.jDo("boolAtomC -: boolAtomC");
                js.jSet("intAtomC", intAtom);
                js.jDo("intAtomC -: intAtom");
                js.jSet("doubleAtomC", doubleAtom);
                js.jDo("doubleAtomC -: doubleAtom");

                js.jSet("boolArrayC", boolArray);
                js.jDo("boolArrayC -: boolArray");
                js.jSet("intArrayC", intArray);
                js.jDo("intArrayC -: intArray");
                js.jSet("doubleArrayC", doubleArray);
                js.jDo("doubleArrayC -: doubleArray");
                js.jSet("byteArrayC", byteArray);
                js.jDo("byteArrayC -: byteArray");
                js.jSet("stringArrayC", stringArray);
                js.jDo("stringArrayC -: stringArray");

                // no overload for this case - it's not
                // as important as the rank 1 case
                //js.jSet("stringArray2C", stringArray2);

                // Datatable's are supported by the interface
                // as they can be quickly displayed and manipulated
                // in DataGridView objects
                DataTable dt = new DataTable();
                dt.Clear();

                // generate test j datatable representation - the interface
                // loads a support locale CSsrv that contains the necessary
                // j verbs to support these representations
                js.jDo("DTTEST=: testDataTable_CSsrv_ >:?100 10");

                // get the datatable
                dt = js.jGet("DTTEST");

                // set a copy of the datatable back in j and test equivalence
                // slight differences in floating number character formats
                // are reconciled with (testDataTableMatch)
                js.jSet("DTTESTC", dt);
                js.jDo("DTTESTC testDataTableMatch_CSsrv_ DTTEST");

                // wait five seconds before shutting
                // down so user can view the j exe server
                System.Threading.Thread.Sleep(5000);
            }
        }
    }
