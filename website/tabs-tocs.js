<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Function to generate TOC
        function generateTOC(tabId, tocContainerId) {
            const tabContent = document.querySelector(tabId);
            const tocContainer = document.querySelector(tocContainerId);
            tocContainer.innerHTML = ''; // Clear previous TOC content
            
            // Add "Table of Contents" heading
            const tocHeading = document.createElement("h6");
            tocHeading.textContent = "Table of Contents";
            tocContainer.appendChild(tocHeading);
            
            const headers = tabContent.querySelectorAll("h2");
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
            const activeTab = document.querySelector('.tab-pane.active');
            const tocContainer = document.querySelector('#quarto-margin-sidebar');
            if (activeTab) {
                generateTOC(`#${activeTab.id}`, '#quarto-margin-sidebar');
            }
        }

        // Adjust initial position of TOC and handle scrolling
        function adjustTOCPosition() {
            const toc = document.querySelector('#quarto-margin-sidebar');
            const initialOffsetTop = 122; // Initial offset value
            const scrollTop = window.pageYOffset || document.documentElement.scrollTop;

            if (scrollTop > initialOffsetTop) {
                toc.style.top = '0px'; // Fixed position near the top
            } else {
                toc.style.top = `${initialOffsetTop - scrollTop}px`; // Adjust as you scroll
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
    });
</script>