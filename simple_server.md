

## Calling Sage from Other Applications

Sage can be started and controlled via a pseudo-tty in the same way Sage calls and makes use of many of it's components. However, an even easier way to use Sage as a backend computational engine is to use the builtin simple server. This simple server can be called from any program that can make HTTP requests. There is self-contained example at <a class="http" href="http://hg.sagemath.org/sage-main/file/tip/sage/server/simple/twist.py">the top of the file</a>, and an example using PHP is below.  


### Start the Server

First we need to start up a Sage notebook server process. There are many ways to do this, but for a self-contained server (that doesn't interfere with your personal notebook, cleans itself up on disposal, and has a single randomly-crated account) create the file `serve.py` 


```txt
import time, os, random

from sage.server.misc import find_next_available_port
from sage.server.notebook.notebook_object import test_notebook
port = find_next_available_port(9000, verbose=False)
passwd = hex(random.randint(1,1<<128))

f = open('notebook_info.txt', 'w')

# create a new, empty notebook with a single user
nb = test_notebook(passwd, secure=False, address='localhost', port=port, verbose=True)

f.write("%s\n%s\n" % (port, passwd))
f.close()

print "Press control-C to stop."

try:
    # wait until a ^C
    while True:
        time.sleep(10)
except KeyboardInterrupt:
    pass

print "Killing notebook."
nb.dispose()
```
 

And the server can be started with  


```txt
$ sage -python serve.py
```
Upon running this command, the configuration (port and temporary password) will be written to `notebook_info.txt`. Change the `address` flag to something other than localhost if you wish to use it from a separate computer.  


### Use the Server

Sage is now ready to be used from another process, either locally or remotely. The following is a very simple PHP script to interface with Sage. 


```txt
<?php

$sage_divider = "___S_A_G_E___";

if (isset($_REQUEST['sage_session']) and $_REQUEST['sage_session']) {
    $sage_session = $_REQUEST['sage_session'];
}


if (!isset($json_decode)) {
    
    function _unwrap($s) {
        $s = trim($s);
        if ($s[0] == '"') {
            return substr($s, 1, -1);
        }
        else if ($s[0] == '[') {
            // assumes no comma in items
            $s = trim(substr($s, 1,-1));
            if ($s == "") {
                return array();
            }
            else if (strpos($s, ',') === FALSE) {
                return array(_unwrap($s));
            }
            $all = explode(',', substr($s, 1,-1));
            for($i=0; $i<count($all); $i++) {
                $all[$i] = _unwrap($all[$i]);
            }
            return $all;
        }
        else {
            return intval($s);
        }
    }
    
    function json_decode($s, $assoc=1) {
        // just enough to parse the sage return results...
        $res = array();
        $s = trim($s);
        $s = substr($s, 1, -1); // the outside {}'s
        $all = explode(':', $s);  // can't split on ,'s
        $key = $all[0];
        for($i=1; $i < count($all)-1; $i++) {
            $comma = strrpos($all[$i], ',');
            $val = substr($all[$i], 0, $comma);
            $res[$key] = $val;
            $key = substr($all[$i], $comma+1);
        }
        $res[$key] = $all[count($all)-1];
        // now process the items
        $res2 = array();
        foreach($res as $key => $val) {
            $res2[_unwrap($key)] = _unwrap($val);
        }
        return $res2;
    }
}


function sage_login($server, $username, $password, $renew=0) {
    global $sage_session, $sage_url, $sage_divider;
    $sage_url = $server;
    $page = file_get_contents("$sage_url/simple/login?username=$username&password=$password");
    $res_array = explode($sage_divider, $page);
    $res = json_decode($res_array[0]);
    $sage_session = $res['session'];
    return $sage_session;
}

function sage_eval($line) {
    global $sage_session, $sage_url, $sage_divider;
    $page = file_get_contents("$sage_url/simple/compute?session=$sage_session&code=".urlencode($line));
    $res_array = explode($sage_divider, $page);
    $res = json_decode($res_array[0]);
    $res['result'] = $res_array[1];
    return $res;
}

function sage_readfile($cell, $file) {
    global $sage_session, $sage_url;
    readfile("$sage_url/simple/file?session=$sage_session&cell=$cell&file=$file");
}

function sage_logout() {
    global $sage_session, $sage_url;
    file_get_contents("$sage_url/simple/logout?session=$sage_session");
}

function sage_create_integer($val, $name=NULL) {
    return sage_create_generic("ZZ", $val, $name);
}

function sage_create_rational($val, $name=NULL) {
    return sage_create_generic("QQ", $val, $name);
}

function sage_create_real($val, $name=NULL) {
    return sage_create_generic("RealNumber", $val, $name);
}

function sage_create_expression($val, $name=NULL) {
    return sage_create_generic("SR", $val, $name);
}

$sage_name_counter = 0;

function sage_create_generic($parent, $val, $name=NULL) {
    global $sage_name_counter;
    if ($name == NULL) {
        $sage_name_counter += 1;
        $name = "_php_sage_$sage_name_counter";
    }
    sage_eval("$name = $parent('''" . addslashes($val) . "''')");
    return $name;
}

?>
```
Now for a simple example which takes a function and plots and differentiates it.  


```txt
<?php

include "sage.php";

// You could hard-code these...
$data = explode("\n", file_get_contents("notebook_info.txt", "r"));
$pass = $data[1];
$port = $data[0];
$server = "http://localhost:$port";

if (!isset($sage_session) || !$sage_session) {
    sage_login($server, "admin", $pass);
}
else {
    $sage_url = $server;
}



if (isset($_REQUEST['file'])) {
    sage_readfile($_REQUEST['cell'], $_REQUEST['file']);
}
else {
    
?>

<html>
<body>
<?php

if (isset($_REQUEST['expr'])) {

    $f = sage_create_expression($_REQUEST['expr']);
    $res = sage_eval("$f.diff(x)");
    $df = $res['result'];
    $res = sage_eval("plot($f, (x, -5, 5))");
    $plot = $res['files'][0];
    $cell = $res['cell_id'];

//    sage_logout();
    
    echo "f(x) = $_REQUEST[expr]<br>\n";
    echo "df/dx = $df\n<br><br>\n";
    echo "<img src='diff.php?cell=$cell&file=$plot&sage_session=$sage_session'>\n";

    $f_str = $_REQUEST['expr'];
    
    echo "<hr>";
    
}
else {
    $f_str = "";
}


echo "<form>\n";
if (isset($sage_session)) {
    echo "<input type='hidden' name='sage_session' value='$sage_session'>\n";
}
echo "f(x) = <input type='text' name='expr' value='$f_str'>\n";
echo "<input type='submit'>";
echo "</form>\n";

?>
</html>


<?php } ?>
```
Put these two files into your web directory, and hard code the password and/or path to `notebook_info.txt` from above, and it is ready to use. (It takes a bit to start up a new sage session the first time it is accessed.) Note that the user input is _not_ directly passed to Sage, as this would be a huge security risk. In contrast `sage_create_*` functions above are safe, as they do not use Python's `eval`.  

This is just the tip of the iceburg, and can easily be translated to other languages such as Java, C, etc. If timeout it set to values other than -1 long-running computations can be started and later queried/interrupted. Images and other files can be served up directly, and all of Sage is at your disposal.  
