<script>
            document.addEventListener("DOMContentLoaded", function() {
              // Select the original footnotes container
              var originalFootnotes = document.querySelector(".footnotes");

              // Select the custom footnotes placeholder
              var customFootnotes = document.getElementById("custom-footnotes");

              // If both elements exist, move the footnotes
              if (originalFootnotes && customFootnotes) {
                customFootnotes.innerHTML = originalFootnotes.innerHTML;

                // Optionally, remove the original footnotes
                originalFootnotes.remove();
              }
            });
          </script>