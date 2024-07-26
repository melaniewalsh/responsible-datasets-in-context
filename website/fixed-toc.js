<script>
function htmlTableOfContents(documentRef) {
    var documentRef = documentRef || document;
    var toc = documentRef.getElementById('toc');
    if (!toc) return;
    toc.innerHTML = '';


    var activeTabPane = documentRef.querySelector('.tab-pane.active');
    if (!activeTabPane) return;
    var headings = [].slice.call(activeTabPane.querySelectorAll('h1, h2, h3, h4, h5, h6'));
    if (headings.length === 0) return;


    var title = document.createElement('h3');
    title.textContent = 'Table of Contents:';
    toc.appendChild(title);


    var ul = document.createElement('ul'); // Create a list for the ToC entries


    headings.forEach(function (heading, index) {
        var anchor = documentRef.createElement('a');
        anchor.setAttribute('name', 'toc' + index);
        anchor.setAttribute('id', 'toc' + index);


        var link = document.createElement('a');
        link.setAttribute('href', '#toc' + index);
        link.textContent = heading.textContent;


        var li = document.createElement('li');
        li.setAttribute('class', heading.tagName.toLowerCase());


        li.appendChild(link);
        ul.appendChild(li);
        heading.parentNode.insertBefore(anchor, heading);
    });


    toc.appendChild(ul); // Append the list to the ToC div
}


// Run the ToC generation on page load
window.addEventListener('load', function() {
    htmlTableOfContents();
});


// Listen for tab changes to regenerate the ToC
document.addEventListener('click', function(event) {
    if (event.target.matches('.nav.nav-tabs .nav-item .nav-link')) {
        setTimeout(htmlTableOfContents, 100);  // Delay to wait for the tab to become active
    }
});
</script>