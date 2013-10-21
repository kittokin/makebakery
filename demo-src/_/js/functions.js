var dirname_re = /^.*\//;

// Given the data from pages.json, build the navigation links that should
// appear in the header, and insert them there.
function build_header_nav(data) {
    var nav = $.map(data, function(item, i){
        // data will contain all files in the site. Toplevel nav header should
        // contain all children nodes of the root node. That is, all nodes of
        // the form:
        //      (root)/something.html
        //      (root)/something/index.html
        // but not
        //      (root)/index.html
        // The site root is omitted from the paths specified in pages.json.
        // They all begin with "/"
        
        // Skip the dummy object marking the end of the array
        if (!item.title) return;

        // Throw out anything that's not this directory or sub/index.html
        var path = item.path.substr(1).split('/');
        if (path.length > 2) return;
        if (path.length == 2 && path[1] != "index.html") return;
        if (path.length < 1) return;
        if (path[0] == "index.html") return;

        var target = site_root + path.join('/');
        // If the current item is the page we're on, set a class so it can
        // be displayed differently.
        var current = '';
        if (window.location.pathname == target ||
            (window.location.pathname.substr(-1) == '/' && 
            window.location.pathname + "index.html" == target)) {
            current = 'active'; 
        }

        // Build up the HTML for the object.
        return (
            "<li class='" +
            current +
            "'><a href=\'"+
            target +
            "\'>" +
            (item.short_title || item.title) +
            "</a></li>");

    }).join("");
    $('ul.nav').html(nav);
}

// Can be passed in data.sort() to sort by modification date
function sort_modified(a,b) {
    return a.modified - b.modified;
}

// Given data in the form of pages.json, build an object tree
function build_tree(data) {
    data.forEach(function(v){

    });
}

// Given the data from pages.json, build a hierarchical site-map
function build_sitemap(data) {
    var target = $('#sitemap');
    if (!target.length) return;
}

// Given the data from pages.json, build a list of child nodes of current.
function build_child_links(data) {
    var target = $('h2:contains(Child pages)');
    if (!target.length) return;
    var nav = $.map(data, function(item, i){
        // data will contain all files in the site. Toplevel nav header should
        // contain all children nodes of the root node. That is, all nodes of
        // the form:
        //      (root)/something.html
        //      (root)/something/index.html
        // but not
        //      (root)/index.html
        // The site root is omitted from the paths specified in pages.json.
        // They all begin with "/"
        
        // Skip the dummy object marking the end of the array
        if (!item.title) return;

        // Throw out anything that's not this directory or sub/index.html
        var path = item.path.substr(1).split('/');
        if (path.length > 2) return;
        if (path.length == 2 && path[1] != "index.html") return;
        if (path.length < 1) return;
        if (path[0] == "index.html") return;

        var target = site_root + path.join('/');
        // If the current item is the page we're on, set a class so it can
        // be displayed differently.
        var current = '';
        if (window.location.pathname == target ||
            (window.location.pathname.substr(-1) == '/' && 
            window.location.pathname + "index.html" == target)) {
            current = 'active'; 
        }

        // Build up the HTML for the object.
        return (
            "<li class='" +
            current +
            "'><a href=\'"+
            target +
            "\'>" +
            (item.short_title || item.title) +
            "</a></li>");

    }).join("");
    target.after("<ul>" + nav + "</ul>");
}


$(document).ready(function (){
    $.getJSON(site_root + 'pages.json')
        .done(build_header_nav)
        .done(build_sitemap)
        .done(build_child_links);
});
