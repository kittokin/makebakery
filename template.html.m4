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
    <link rel="stylesheet" href="/__ROOT`'_/css/bootstrap.min.css">
    <link rel="stylesheet" href="/__ROOT`'_/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/__ROOT`'_/css/style.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="/__ROOT`'_/js/html5shiv.js"></script>
      <script src="/__ROOT`'_/js/respond.min.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="/__ROOT`'_/img/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/__ROOT`'_/img/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/__ROOT`'_/img/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/__ROOT`'_/img/apple-touch-icon-57-precomposed.png">

    m4_dnl hook up our atom feed
    <link href="/__ROOT`'atom.xml" type="application/atom+xml" rel="alternate" title="Sitewide ATOM Feed">
  </head>

  <body>
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/__ROOT">__SITENAME</a>
        </div>m4_dnl /navbar-header
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </div>m4_dnl /navbar-collapse
      </div>m4_dnl /container
    </div>m4_dnl /navbar

    <!-- Let's not demo the breadcrumb navigation until it works automatically.
    <div class="container">
      <ol class="breadcrumb">
        <li><a href="#"></a></li>
        <li><a href="#">Library</a></li>
        <li class="active">Data</li>
      </ol>
    </div>m4_dnl /container
    -->

    <div class="container">
      <h1>__TITLE</h1>
m4_dnl
m4_divert(3)m4_dnl  --- Content will be placed here ---
m4_dnl
    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/__ROOT`'_/js/jquery-2.0.3.min.js"></script>
    <script src="/__ROOT`'_/js/bootstrap.min.js"></script>

m4_dnl  Get some other variables useful to javascript into the page context.
<script type="text/javascript">
m4_dnl  If the original created date for the document is defined, make it
m4_dnl  available to javascript.
m4_ifdef(`__DATE_MSEC', `
  var created = new Date(__DATE_MSEC);
')
  var site_root = "/__ROOT";
</script>

m4_dnl  this is where we put our custom functions
<script src="/__ROOT`'_/js/functions.js"></script>

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
m4_dnl vim: ft=html sw=2 :