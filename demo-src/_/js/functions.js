var dirname_re = /^.*\//;

$(document).ready(function (){
    return;
    $.getJSON('pages.json', function(data){
        // data contains an array of all the content nodes on our site. We can
        // now build a navagation heiarchy however we like.
        data.sort(function(a,b){
            return a.modified - b.modified;
        });
        $('nav').html($.map(data, function(item, i){
            // data will contain all files in the site. Nav box should contain
            // all children nodes, which means nil if this is files in current directory, and index files from
            // subdirectories of this one.
            //
            // Skip the dummy object marking the end of the array
            if (!item.title) return "";
            // Normalize the pathname since */ and */index.html refer to the
            // same thing to our webserver
            var pathname = window.location.pathname;
            if (pathname.substr(-1) == '/') {
                pathname = pathname + 'index.html';
            }
            // Throw out anything that's not this directory or sub/index.html
            if (item.path.match(dirname_re)[0] != pathname.match(dirname_re)[0]) {
                return;
            }

            // Create javascript date objects from the timestamps in the item
            var created = new Date(item.created);
            var modified = new Date(item.modified);
            // If the current item is the page we're on, set a class so it can
            // be displayed differently.
            var current = '';
            if (window.location.pathname == item.path ||
                (window.location.pathname.substr(-1) == '/' && 
                window.location.pathname + "index.html" == item.path)) {
                current = "current"; 
            }
            // Build up the HTML for the object.
            return (
                "<li class='" +
                current +
                "'><a href=\'"+
                item.path + 
                "\'>" +
                item.title +
                "</a> <span class=\'date\'>" +
                modified.getMonth() +
                "/" +
                modified.getDay() +
                "</span></li>");
        }).join(""));
    })
});
