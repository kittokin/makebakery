var dirname_re = /^.*\//;

// Given the data from pages.json, build the navigation links that should
// appear in the header, and insert them there.
function build_header_nav(data) {
    data.sort(function(a,b){
        return a.modified - b.modified;
    });
    console.log(data);
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

$(document).ready(function (){
    $.getJSON(site_root + 'pages.json', build_header_nav);
});
