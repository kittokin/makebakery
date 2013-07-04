m4_divert(1)m4_dnl
<!doctype html>
m4_dnl  Prepare some default values. If we have not defined a __TITLE macro in
m4_dnl  the content, the page title will be "Untitled Page."
m4_ifdef(`__TITLE',, `m4_define(`__TITLE', `Untitled Page')')

<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>__TITLE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="title" content="__TITLE">
    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="author" content="Your Name Here">
    <meta name="Copyright" content="Copyright Your Name Here 2011. All Rights Reserved.">

    m4_dnl  Dublin Core Metadata : http://dublincore.org/
    <meta name="DC.title" content="__TITLE">
    <meta name="DC.subject" content="">
    <meta name="DC.creator" content="">
    <meta name="DC.date" content="__DATE_ISO">

    <!-- Le styles -->
    <link rel="stylesheet" href="_/css/bootstrap.min.css">
    <link rel="stylesheet" href="_/css/style.css">
    <link rel="stylesheet" href="_/css/bootstrap-responsive.min.css">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="_/img/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="_/img/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="_/img/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="_/img/apple-touch-icon-57-precomposed.png">

    m4_dnl hook up our atom feed
    <link href="atom.xml" type="application/atom+xml" rel="alternate" title="Sitewide ATOM Feed">
  </head>

  <body>

    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="/__ROOT">__SITENAME</a>
          <div class="nav-collapse">
            <ul class="nav">
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
<ul class="breadcrumb">
  <li><a href="#">Home</a> <span class="divider">/</span></li>
  <li><a href="#">Library</a> <span class="divider">/</span></li>
  <li class="active">Data</li>
</ul>
    </div>

    

    <div class="container">
        <h1>__TITLE</h1>
m4_dnl
m4_divert(3)m4_dnl  --- Content will be placed here ---
m4_dnl
    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="_/js/jquery-1.7.2.min.js"></script>
    <script src="_/js/bootstrap.min.js"></script>

m4_dnl  If the original created date for the document is defined, make it
m4_dnl  available to javascript.
m4_ifdef(`__DATE_MSEC', `<script type="text/javascript">
    var created = new Date(__DATE_MSEC);
    </script>')

m4_dnl  this is where we put our custom functions
<script src="_/js/functions.js"></script>

m4_ifdef(`__GACODE', `<script>
    var _gaq = _gaq || [];
    _gaq.push(["_setAccount", "__GACODE"]);
    _gaq.push(["_trackPageview"]);
    (function() {
        var ga = document.createElement("script"); ga.type = "text/javascript"; ga.async = true;
        ga.src = ("https:" == document.location.protocol ? "https://ssl" : "http://www") + ".google-analytics.com/ga.js";
        var s = document.getElementsByTagName("script")[0]; s.parentNode.insertBefore(ga, s);
    })();
</script>') 

  </body>
</html>
m4_dnl vim: ft=m4 :
