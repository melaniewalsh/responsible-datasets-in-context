
$(document).ready(function () {
    // Assign data-tab-name attribute based on the inner text of the tab links
    $('.nav-tabs .nav-link').each(function () {
        var tabName = $(this).text().toLowerCase().replace(/ /g, '-');
        $(this).attr('data-tab-name', tabName);
    });

    function activaTab(tabName, container = document) {
        var tabLink = $(container).find('.nav-tabs .nav-link[data-tab-name="' + tabName + '"]');
        tabLink.tab('show');
        tabLink.trigger('click'); // Explicitly trigger the click event
    }

    function scrollToAnchor(anchorId) {
        var element = $('[data-anchor-id="' + anchorId + '"]');
        if (element.length) {
            $('html, body').animate({
                scrollTop: element.offset().top
            }, 500);
        }
    }

    function activateTabAndHeaderFromUrl() {
        var urlParams = new URLSearchParams(window.location.search);
        var tabName = urlParams.get('tab');
        var anchorId = urlParams.get('anchor');
        var nestedTabName = urlParams.get('nested-tab');

        if (tabName) {
            activaTab(tabName);
            if (anchorId) {
                setTimeout(function() {
                    scrollToAnchor(anchorId);
                }, 100); // Delay to ensure tab content is visible
            }
            if (nestedTabName) {
                setTimeout(function() {
                    var parentContainer = $('.nav-link[data-tab-name="' + tabName + '"]').attr('data-bs-target');
                    activaTab(nestedTabName, parentContainer); // Dynamically find the parent container
                }, 200); // Delay to ensure parent tab content is visible
            }
        } else {
            // Default to the first tab if no tab is specified
            var firstTabName = $('.nav-tabs .nav-link').first().attr('data-tab-name');
            activaTab(firstTabName);
        }
    }

    function clearPreviousAnchor() {
        var url = new URL(window.location.href);
        url.hash = ''; // Clear the hash part of the URL
        history.replaceState(null, null, url.toString());
    }

    // Activate the tab and scroll to anchor based on the URL when the page loads
    activateTabAndHeaderFromUrl();

    // Update URL query parameters when a tab is shown
    $('.nav-tabs a').on('shown.bs.tab', function (e) {
        clearPreviousAnchor(); // Clear any previous anchors before switching tabs
        var tabName = $(e.target).attr('data-tab-name');
        var parentTabPane = $(e.target).closest('.tab-content').prev('.nav-tabs').find('.nav-link.active').attr('data-tab-name');
        var url = new URL(window.location.href);

        if (parentTabPane) {
            url.searchParams.set('tab', parentTabPane);
            url.searchParams.set('nested-tab', tabName);
        } else {
            url.searchParams.set('tab', tabName);
            url.searchParams.delete('nested-tab');
        }

        url.searchParams.delete('anchor'); // Remove anchor parameter when switching tabs
        history.replaceState(null, null, url.toString());
    });

    // Re-activate the tab and scroll to anchor if the query parameters change
    $(window).on('popstate', function () {
        activateTabAndHeaderFromUrl();
    });
});
