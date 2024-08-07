<script>
document.addEventListener("DOMContentLoaded", function () {
    if (document.body.classList.contains('custom-sidebar')) {
        // Function to generate TOC
        function generateTOC(tabId, tocContainerId) {
            const tabContent = document.querySelector(tabId);
            const tocContainer = document.querySelector(tocContainerId);
            tocContainer.innerHTML = ''; // Clear previous TOC content
            
            // Add "Table of Contents" heading
            const tocHeading = document.createElement("h2");
            tocHeading.textContent = "Table of Contents";
            tocContainer.appendChild(tocHeading);
            
            // Select headers in tab content, including nested headers within tabsets
            const headers = tabContent.querySelectorAll("h2, h3, h4, h5, h6");
            const tocList = document.createElement("ul");

            headers.forEach((header) => {
                // Ensure each header has a meaningful id for linking
                if (!header.id) {
                    header.id = header.textContent.toLowerCase().replace(/\s+/g, '-').replace(/[^\w\-]+/g, '');
                }
                const tocItem = document.createElement("li");
                const tocLink = document.createElement("a");
                tocLink.href = `#${header.id}`;
                tocLink.textContent = header.textContent;
                tocItem.appendChild(tocLink);
                tocList.appendChild(tocItem);
            });

            tocContainer.appendChild(tocList);
        }

        // Generate TOCs for the active tab
        function updateActiveTabTOC() {
            const activeTab = document.querySelector('.tab-pane[id^="tabset-2-"].active.show');
            const tocContainer = document.querySelector('#toc-container');
            if (activeTab) {
                generateTOC(`#${activeTab.id}`, '#toc-container');
            }
        }

        // Adjust initial position of TOC and handle scrolling
        function adjustTOCPosition() {
            const toc = document.querySelector('#quarto-margin-sidebar');
            const navbarHeight = document.querySelector('.navbar').offsetHeight || 64; // Use 64 as a default value if navbar is not found
            const initialOffsetTop = navbarHeight; // Adjust to match navbar height
            const scrollTop = window.pageYOffset || document.documentElement.scrollTop;

            if (scrollTop > initialOffsetTop) {
                toc.style.top = '0px'; // Fixed position near the top
                toc.style.maxHeight = '100vh';
            } else {
                toc.style.top = `${initialOffsetTop - scrollTop}px`; // Adjust as you scroll
                toc.style.maxHeight = `calc(100vh - ${initialOffsetTop}px)`;
            }
        }

        // Run the TOC generation and adjust position on page load
        updateActiveTabTOC();
        adjustTOCPosition();

        // Listen for tab changes to regenerate the TOC
        document.addEventListener('shown.bs.tab', function(event) {
            setTimeout(updateActiveTabTOC, 100);  // Delay to wait for the tab to become active
        });

        // Listen to scroll events to adjust TOC position
        window.addEventListener('scroll', adjustTOCPosition);
    }
});


</script>