 
[More about JHS with the DHTMLX Grid](https://bakerjd99.wordpress.com/2012/12/04/more-about-jhs-with-dhtmlx-the-grid/)
---------------------------------------------------------------------------------------------------------------------

*Posted: 05 Dec 2012 04:22:50*

I have resolved my [DHTMLX standard
edition](https://dhtmlx.com/docs/download.shtml) row data extraction
problem. The standard edition does not serialize grids or track user
cell changes. You have to pay for such luxuries. Because I’m a [foul
software Grinch](https://www.youtube.com/watch?v=ZgP0aUKlmNw) and this is
just an exploratory hack I had to roll my own. I am posting the relevant
JavaScript because I could not find similar examples. Here is how you
can fetch rows from standard edition DHTMLX grids and save them as JSON
in a hidden `textarea` element. Eric Iverson suggested hidden
`textarea`s and they work like a charm.


    function ev_saveme_click(){

      if ('undefined' != typeof grid0){
      
        if (0 == grid0.getRowsNum()){
          jbyid("rerowcnt").innerHTML = "No rows to save"; 
          return;
        }

        var st = new Date().getTime(),  // start time  
            ids = grid0.getAllRowIds(","),
            ccnt = 1 + grid0.getColumnsNum();  // includes id
          
        ids = ids.split(",");  
        var rcnt = ids.length,
            tab = new Array(rcnt);
        
        // header row - tab[0][0] cell ignored
        tab[0] = new Array(ccnt);  
        for (var i = 1; i < ccnt; i++) {
          tab[0][i] = grid0.getColumnLabel(i-1,0); 
        }
         
        // cells with leading row id
        for (var i = 0 , si = 1 ; i < rcnt; i++ , si++) {
          tab[si] = new Array(ccnt);
          for (var j = 1; j < ccnt; j++) {
            tab[si][j] = grid0.cells((+ids[i]),j-1).getValue();
          }
          tab[si][0] = ids[i];
        }
      
        // prefix row column counts 
        var pfx = (rcnt+1) + " " + ccnt + "*";
        jbyid("gridchgs").innerHTML = pfx + JSON.stringify(tab);
        jdoajax(["gridchgs","tout"],"");
      
        var et = new Date().getTime() - st;  // end time    
        jbyid("rerowcnt").innerHTML= " row count= " + grid0.getRowsNum() +  
            ",  JavaScript ms= " + et; 
            
      } else {
      
        jbyid("rerowcnt").innerHTML= "Nothing to save";     
      }
    }

Passing data back to J is fast but the J JSON addon `convert\json` burps
on large datasets. For this demo I substituted a simple table oriented
parser that is much faster.
