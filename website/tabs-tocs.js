<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Function to generate TOC
        function generateTOC(tabId, tocContainerId) {
            const tabContent = document.querySelector(tabId);
            const tocContainer = document.querySelector(tocContainerId);
            tocContainer.innerHTML = ''; // Clear previous TOC content

            console.log(`Generating TOC for: ${tabId}`);

            // Add "Table of Contents" heading
            const tocHeading = document.createElement("h6");
            tocHeading.textContent = "Table of Contents";
            tocContainer.appendChild(tocHeading);

            // Select only h2 headers, including nested tabsets
            const headers = tabContent.querySelectorAll("h2");
            console.log(`Found ${headers.length} h2 headers`);

            const tocList = document.createElement("ul");
            headers.forEach((header) => {
                console.log(`Header: ${header.textContent}`);
                if (!header.id) {
                    header.id = header.textContent.toLowerCase().replace(/\s+/g, '-').replace(/[^\w\-]+/g, '');
                }
                const tocItem = document.createElement("li");
                tocItem.className = `toc-${header.tagName.toLowerCase()}`; // Add class for styling
                const tocLink = document.createElement("a");
                tocLink.href = `#${header.id}`;
                tocLink.textContent = header.textContent; // No title case conversion
                tocItem.appendChild(tocLink);
                tocList.appendChild(tocItem);
            });

            tocContainer.appendChild(tocList);
        }

        // Function to update TOC when tab changes
        function updateActiveTabTOC() {
            const activeTab = document.querySelector('.tab-pane.active');
            const tocContainer = document.querySelector('#quarto-margin-sidebar-toc');
            if (activeTab) {
                generateTOC(`#${activeTab.id}`, '#quarto-margin-sidebar-toc');
            }
        }

        // Create and insert TOC container if it doesn't exist
        function createTOCContainer() {
            const sidebar = document.querySelector('#quarto-margin-sidebar');
            if (sidebar) {
                const existingTOC = document.querySelector('#quarto-margin-sidebar-toc');
                if (!existingTOC) {
                    const tocContainer = document.createElement('div');
                    tocContainer.id = 'quarto-margin-sidebar-toc';
                    tocContainer.style.position = 'relative';
                    tocContainer.style.padding = '10px';
                    // tocContainer.style.border = '1px solid #ddd';
                    sidebar.appendChild(tocContainer);
                }
            }
        }

        // Initialize TOC container and run the TOC generation
        createTOCContainer();
        updateActiveTabTOC();

        // Listen for tab changes to regenerate the TOC
        document.addEventListener('shown.bs.tab', function(event) {
            setTimeout(updateActiveTabTOC, 100);  // Delay to wait for the tab to become active
        });
    });
</script>
