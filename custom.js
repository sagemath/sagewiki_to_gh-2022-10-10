

(function() {
    var jq = document.createElement('script');
    jq.type = 'text/javascript';
    jq.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'aleph.sagemath.org/static/jquery.min.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(jq, s);
})();

$.getScript('http://aleph.sagemath.org/embedded_sagecell.js').done(function(script, textStatus ) {
    sagecell.makeSagecell({inputLocation: '.sagecellraw'});
});
